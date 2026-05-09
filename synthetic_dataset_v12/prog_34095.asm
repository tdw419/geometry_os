; DESCRIPTION: Draws a green rectangle at (379, 110) with width 31 and height 16.
; PLAN: r0=379(x), r1=110(y), r2=31(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 110
LDI r2, 31
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
