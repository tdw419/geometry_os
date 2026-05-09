; DESCRIPTION: Draws a yellow rectangle at (22, 73) with width 120 and height 39.
; PLAN: r0=22(x), r1=73(y), r2=120(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 73
LDI r2, 120
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
