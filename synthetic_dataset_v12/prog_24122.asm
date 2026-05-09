; DESCRIPTION: Draws a yellow rectangle at (185, 14) with width 95 and height 50.
; PLAN: r0=185(x), r1=14(y), r2=95(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 14
LDI r2, 95
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
