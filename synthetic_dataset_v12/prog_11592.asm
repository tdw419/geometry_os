; DESCRIPTION: Draws a yellow rectangle at (306, 180) with width 64 and height 73.
; PLAN: r0=306(x), r1=180(y), r2=64(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 180
LDI r2, 64
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
