; DESCRIPTION: Draws a green rectangle at (364, 58) with width 16 and height 79.
; PLAN: r0=364(x), r1=58(y), r2=16(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 58
LDI r2, 16
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
