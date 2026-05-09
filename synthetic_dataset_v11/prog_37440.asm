; DESCRIPTION: Draws a blue rectangle at (26, 211) with width 85 and height 16.
; PLAN: r0=26(x), r1=211(y), r2=85(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 211
LDI r2, 85
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
