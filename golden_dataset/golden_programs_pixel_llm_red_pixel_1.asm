; DESCRIPTION: Draw rectangle: pos=the screen, color=red, size=fixed size.

; Pixel-LLM generated: Draw a red pixel
LDI r0, 0x00FF00
LDI r8, 0x0000FF00  ; purple
RECTF r8, r3, r11, r1, r0
LDI r3, 1
LDI r11, 0x4444
LDI r11, 0xFFFFFF
RECTF r11, r1, r1, r1, r5
LDI r20, BUF
LDI r20, TXT_BUF
RECTF r0, r8, r3, r5
LDI r0, 231
LDI r8, 16
LDI r3, 256
LDI r1, 24
LDI r1, 30
RECTF r0, r8, r3, r11, r1
LDI r20, BUF
LDI r20, TXT_BUF
STRO r20, "Size: 8x8"
LDI r8, 1000
TEXT r2, r0, r8, r3, r11
HALT
