; DESCRIPTION: Draws a yellow rectangle at (135, 22) with width 71 and height 120.
; PLAN: r0=135(x), r1=22(y), r2=71(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 22
LDI r2, 71
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
