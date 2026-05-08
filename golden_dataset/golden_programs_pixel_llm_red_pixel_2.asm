; DESCRIPTION: Geometry OS program to draw a red rectangle.

; Pixel-LLM generated: Draw a red pixel
LDI r3, 0x00FF00
LDI r11, 0x0000FF00  ; purple
RECTF r11, r8, r5, r4, r3
LDI r8, 1
LDI r5, 0x4444
LDI r5, 0xFFFFFF
RECTF r5, r4, r4, r4, r7
LDI r20, BUF
LDI r20, TXT_BUF
RECTF r3, r11, r8, r7
LDI r3, 231
LDI r11, 16
LDI r8, 256
LDI r4, 24
LDI r4, 30
RECTF r3, r11, r8, r5, r4
LDI r20, BUF
LDI r20, TXT_BUF
STRO r20, "Size: 8x8"
LDI r11, 1000
TEXT r9, r3, r11, r8, r5
HALT
