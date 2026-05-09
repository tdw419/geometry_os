; DESCRIPTION: Draws a green rectangle at (87, 74) with width 21 and height 110.
; PLAN: r0=87(x), r1=74(y), r2=21(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 74
LDI r2, 21
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
