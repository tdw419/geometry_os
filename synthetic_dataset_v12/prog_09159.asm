; DESCRIPTION: Draws a yellow rectangle at (105, 31) with width 93 and height 120.
; PLAN: r0=105(x), r1=31(y), r2=93(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 31
LDI r2, 93
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
