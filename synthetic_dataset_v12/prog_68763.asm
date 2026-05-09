; DESCRIPTION: Draws a black rectangle at (201, 120) with width 105 and height 90.
; PLAN: r0=201(x), r1=120(y), r2=105(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 120
LDI r2, 105
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
