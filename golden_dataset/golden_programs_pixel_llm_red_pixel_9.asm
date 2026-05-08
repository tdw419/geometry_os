; DESCRIPTION: Geometry OS program to draw a red rectangle.

; Pixel-LLM generated: Draw a red pixel
LDI r14, 0x00FF00
LDI r8, 0x0000FF00  ; purple
RECTF r8, r2, r5, r1, r14
LDI r2, 1
LDI r5, 0x4444
LDI r5, 0xFFFFFF
RECTF r5, r1, r1, r1, r4
LDI r20, BUF
LDI r20, TXT_BUF
RECTF r14, r8, r2, r4
LDI r14, 231
LDI r8, 16
LDI r2, 256
LDI r1, 24
LDI r1, 30
RECTF r14, r8, r2, r5, r1
LDI r20, BUF
LDI r20, TXT_BUF
STRO r20, "Size: 8x8"
LDI r8, 1000
TEXT r11, r14, r8, r2, r5
HALT
