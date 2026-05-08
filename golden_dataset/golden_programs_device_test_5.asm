; DESCRIPTION: Render a colored object at the screen.

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
    LDI r8, 0x000033
    FILL r8

    ; Draw title bar
    LDI r13, 0
    LDI r0, 0
    LDI r15, 256
    LDI r14, 16
    LDI r8, 0x003366
    RECTF r13, r0, r15, r14, r8

    ; Draw status bar at bottom
    LDI r13, 0
    LDI r0, 240
    LDI r15, 256
    LDI r14, 16
    LDI r8, 0x003366
    RECTF r13, r0, r15, r14, r8

    ; === Test 1: Open all 4 devices ===
    ; /dev/screen -> fd 0xE000
    LDI r13, screen_path
    LDI r0, 0
    OPEN r13, r0
    ; r10 = 0xE000 (screen fd)

    ; /dev/keyboard -> fd 0xE001
    LDI r13, kb_path
    LDI r0, 0
    OPEN r13, r0
    ; r10 = 0xE001 (keyboard fd), save to r7
    MOV r7, r10

    ; /dev/audio -> fd 0xE002
    LDI r13, audio_path
    LDI r0, 0
    OPEN r13, r0
    ; r10 = 0xE002 (audio fd), save to r1
    MOV r1, r10

    ; /dev/net -> fd 0xE003
    LDI r13, net_path
    LDI r0, 0
    OPEN r13, r0
    ; r10 = 0xE003 (net fd), save to r12
    MOV r12, r10

    ; === Test 2: IOCTL queries ===
    ; Get screen width (cmd=0) -- should return 256
    LDI r5, 0xE000
    LDI r4, 0
    LDI r9, 0
    IOCTL r5, r4, r9
    ; r10 = 256 (width), store it
    LDI r20, result
    STORE r20, r10

    ; Get screen height (cmd=1) -- should return 256
    LDI r5, 0xE000
    LDI r4, 1
    LDI r9, 0
    IOCTL r5, r4, r9
    ; r10 = 256 (height)

    ; Set keyboard echo mode to 1 (cmd=1)
    LDI r5, 0xE001
    LDI r4, 1
    LDI r9, 1
    IOCTL r5, r4, r9
    ; r10 = 0 (success)

    ; Set audio volume to 50 (cmd=1)
    LDI r5, 0xE002
    LDI r4, 1
    LDI r9, 50
    IOCTL r5, r4, r9
    ; r10 = 0 (success)

    ; Get net status (cmd=0) -- should return 1 (up)
    LDI r5, 0xE003
    LDI r4, 0
    LDI r9, 0
    IOCTL r5, r4, r9
    ; r10 = 1 (net up)

    ; === Test 3: Interactive loop ===
    ; Read keyboard, draw random colored pixels
loop:
    ; Read one key from /dev/keyboard
    LDI r13, key_buf
    LDI r0, 1
    READ r7, r13, r0
    ; r10 = bytes read (1 if key pressed, 0 if not)

    ; If no key, just frame and loop
    LDI r15, 0
    CMP r10, r15
    JZ r10, skip

    ; Key was pressed -- generate random pixel position and color
    RAND r10
    LDI r15, 255
    AND r10, r15       ; r10 = random x (0-255)

    RAND r13
    AND r13, r15       ; r13 = random y (0-255)

    RAND r0
    AND r0, r15       ; r0 = random color component

    ; Make it brighter (add 0x111111)
    LDI r15, 0x111111
    ADD r0, r15

    ; Draw pixel directly
    PSETI r10, r13, r0

    ; Also beep on keypress (via /dev/audio write)
    ; Write (freq=440, dur=50) to audio device
    LDI r13, pixel_buf
    LDI r0, 440
    STORE r13, r0
    LDI r0, 1
    ADD r13, r0       ; r13 = pixel_buf + 1
    LDI r0, 50
    STORE r13, r0
    LDI r13, pixel_buf
    LDI r0, 2
    WRITE r1, r13, r0

skip:
    FRAME
    JMP loop
