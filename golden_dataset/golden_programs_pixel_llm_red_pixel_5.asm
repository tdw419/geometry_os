; DESCRIPTION: Geometry OS program to draw a red rectangle.

; Pixel-LLM generated: Draw a red pixel
LDI r13, 0x00FF00
LDI r5, 0x0000FF00  ; purple
RECTF r5, r2, r8, r9, r13
LDI r2, 1
LDI r8, 0x4444
LDI r8, 0xFFFFFF
RECTF r8, r9, r9, r9, r12
LDI r20, BUF
LDI r20, TXT_BUF
RECTF r13, r5, r2, r12
LDI r13, 231
LDI r5, 16
LDI r2, 256
LDI r9, 24
LDI r9, 30
RECTF r13, r5, r2, r8, r9
LDI r20, BUF
LDI r20, TXT_BUF
STRO r20, "Size: 8x8"
LDI r5, 1000
TEXT r1, r13, r5, r2, r8
HALT
