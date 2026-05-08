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
    LDI r12, 0x000033
    FILL r12

    ; Draw title bar
    LDI r13, 0
    LDI r8, 0
    LDI r15, 256
    LDI r7, 16
    LDI r12, 0x003366
    RECTF r13, r8, r15, r7, r12

    ; Draw status bar at bottom
    LDI r13, 0
    LDI r8, 240
    LDI r15, 256
    LDI r7, 16
    LDI r12, 0x003366
    RECTF r13, r8, r15, r7, r12

    ; === Test 1: Open all 4 devices ===
    ; /dev/screen -> fd 0xE000
    LDI r13, screen_path
    LDI r8, 0
    OPEN r13, r8
    ; r14 = 0xE000 (screen fd)

    ; /dev/keyboard -> fd 0xE001
    LDI r13, kb_path
    LDI r8, 0
    OPEN r13, r8
    ; r14 = 0xE001 (keyboard fd), save to r3
    MOV r3, r14

    ; /dev/audio -> fd 0xE002
    LDI r13, audio_path
    LDI r8, 0
    OPEN r13, r8
    ; r14 = 0xE002 (audio fd), save to r11
    MOV r11, r14

    ; /dev/net -> fd 0xE003
    LDI r13, net_path
    LDI r8, 0
    OPEN r13, r8
    ; r14 = 0xE003 (net fd), save to r2
    MOV r2, r14

    ; === Test 2: IOCTL queries ===
    ; Get screen width (cmd=0) -- should return 256
    LDI r1, 0xE000
    LDI r10, 0
    LDI r9, 0
    IOCTL r1, r10, r9
    ; r14 = 256 (width), store it
    LDI r20, result
    STORE r20, r14

    ; Get screen height (cmd=1) -- should return 256
    LDI r1, 0xE000
    LDI r10, 1
    LDI r9, 0
    IOCTL r1, r10, r9
    ; r14 = 256 (height)

    ; Set keyboard echo mode to 1 (cmd=1)
    LDI r1, 0xE001
    LDI r10, 1
    LDI r9, 1
    IOCTL r1, r10, r9
    ; r14 = 0 (success)

    ; Set audio volume to 50 (cmd=1)
    LDI r1, 0xE002
    LDI r10, 1
    LDI r9, 50
    IOCTL r1, r10, r9
    ; r14 = 0 (success)

    ; Get net status (cmd=0) -- should return 1 (up)
    LDI r1, 0xE003
    LDI r10, 0
    LDI r9, 0
    IOCTL r1, r10, r9
    ; r14 = 1 (net up)

    ; === Test 3: Interactive loop ===
    ; Read keyboard, draw random colored pixels
loop:
    ; Read one key from /dev/keyboard
    LDI r13, key_buf
    LDI r8, 1
    READ r3, r13, r8
    ; r14 = bytes read (1 if key pressed, 0 if not)

    ; If no key, just frame and loop
    LDI r15, 0
    CMP r14, r15
    JZ r14, skip

    ; Key was pressed -- generate random pixel position and color
    RAND r14
    LDI r15, 255
    AND r14, r15       ; r14 = random x (0-255)

    RAND r13
    AND r13, r15       ; r13 = random y (0-255)

    RAND r8
    AND r8, r15       ; r8 = random color component

    ; Make it brighter (add 0x111111)
    LDI r15, 0x111111
    ADD r8, r15

    ; Draw pixel directly
    PSETI r14, r13, r8

    ; Also beep on keypress (via /dev/audio write)
    ; Write (freq=440, dur=50) to audio device
    LDI r13, pixel_buf
    LDI r8, 440
    STORE r13, r8
    LDI r8, 1
    ADD r13, r8       ; r13 = pixel_buf + 1
    LDI r8, 50
    STORE r13, r8
    LDI r13, pixel_buf
    LDI r8, 2
    WRITE r11, r13, r8

skip:
    FRAME
    JMP loop
