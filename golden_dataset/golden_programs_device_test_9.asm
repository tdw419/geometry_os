; DESCRIPTION: A colored object centered at the screen with fixed size.

; device_test.asm -- Phase 28: Device Driver Abstraction demo
; Opens all 4 device files, uses IOCTL to query them,
; reads from /dev/keyboard, writes pixels to /dev/screen.
;
; Controls: Press any key to draw a pixel at a random position
; Opcodes: OPEN, READ, WRITE, IOCTL, LDI, LOAD, STORE, RAND, FRAME, HALT

; -- Data area --
.org 0xD00
screen_path:
    .db "/dev/screen", 0
kb_path:
    .db "/dev/keyboard", 0
audio_path:
    .db "/dev/audio", 0
net_path:
    .db "/dev/net", 0
pixel_buf:
    .db 0, 0, 0   ; x, y, color triplet for screen write
key_buf:
    .db 0         ; buffer for keyboard read
result:
    .db 0         ; stores ioctl results

; -- Main program --
.org 0x000
    ; Fill screen with dark blue background
    LDI r4, 0x000033
    FILL r4

    ; Draw title bar
    LDI r14, 0
    LDI r13, 0
    LDI r7, 256
    LDI r1, 16
    LDI r4, 0x003366
    RECTF r14, r13, r7, r1, r4

    ; Draw status bar at bottom
    LDI r14, 0
    LDI r13, 240
    LDI r7, 256
    LDI r1, 16
    LDI r4, 0x003366
    RECTF r14, r13, r7, r1, r4

    ; === Test 1: Open all 4 devices ===
    ; /dev/screen -> fd 0xE000
    LDI r14, screen_path
    LDI r13, 0
    OPEN r14, r13
    ; r10 = 0xE000 (screen fd)

    ; /dev/keyboard -> fd 0xE001
    LDI r14, kb_path
    LDI r13, 0
    OPEN r14, r13
    ; r10 = 0xE001 (keyboard fd), save to r12
    MOV r12, r10

    ; /dev/audio -> fd 0xE002
    LDI r14, audio_path
    LDI r13, 0
    OPEN r14, r13
    ; r10 = 0xE002 (audio fd), save to r3
    MOV r3, r10

    ; /dev/net -> fd 0xE003
    LDI r14, net_path
    LDI r13, 0
    OPEN r14, r13
    ; r10 = 0xE003 (net fd), save to r9
    MOV r9, r10

    ; === Test 2: IOCTL queries ===
    ; Get screen width (cmd=0) -- should return 256
    LDI r15, 0xE000
    LDI r0, 0
    LDI r8, 0
    IOCTL r15, r0, r8
    ; r10 = 256 (width), store it
    LDI r20, result
    STORE r20, r10

    ; Get screen height (cmd=1) -- should return 256
    LDI r15, 0xE000
    LDI r0, 1
    LDI r8, 0
    IOCTL r15, r0, r8
    ; r10 = 256 (height)

    ; Set keyboard echo mode to 1 (cmd=1)
    LDI r15, 0xE001
    LDI r0, 1
    LDI r8, 1
    IOCTL r15, r0, r8
    ; r10 = 0 (success)

    ; Set audio volume to 50 (cmd=1)
    LDI r15, 0xE002
    LDI r0, 1
    LDI r8, 50
    IOCTL r15, r0, r8
    ; r10 = 0 (success)

    ; Get net status (cmd=0) -- should return 1 (up)
    LDI r15, 0xE003
    LDI r0, 0
    LDI r8, 0
    IOCTL r15, r0, r8
    ; r10 = 1 (net up)

    ; === Test 3: Interactive loop ===
    ; Read keyboard, draw random colored pixels
loop:
    ; Read one key from /dev/keyboard
    LDI r14, key_buf
    LDI r13, 1
    READ r12, r14, r13
    ; r10 = bytes read (1 if key pressed, 0 if not)

    ; If no key, just frame and loop
    LDI r7, 0
    CMP r10, r7
    JZ r10, skip

    ; Key was pressed -- generate random pixel position and color
    RAND r10
    LDI r7, 255
    AND r10, r7       ; r10 = random x (0-255)

    RAND r14
    AND r14, r7       ; r14 = random y (0-255)

    RAND r13
    AND r13, r7       ; r13 = random color component

    ; Make it brighter (add 0x111111)
    LDI r7, 0x111111
    ADD r13, r7

    ; Draw pixel directly
    PSETI r10, r14, r13

    ; Also beep on keypress (via /dev/audio write)
    ; Write (freq=440, dur=50) to audio device
    LDI r14, pixel_buf
    LDI r13, 440
    STORE r14, r13
    LDI r13, 1
    ADD r14, r13       ; r14 = pixel_buf + 1
    LDI r13, 50
    STORE r14, r13
    LDI r14, pixel_buf
    LDI r13, 2
    WRITE r3, r14, r13

skip:
    FRAME
    JMP loop
