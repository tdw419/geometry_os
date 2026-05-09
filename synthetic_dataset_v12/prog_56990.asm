; DESCRIPTION: Draws a yellow rectangle at (356, 80) with width 111 and height 100.
; PLAN: r0=356(x), r1=80(y), r2=111(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 80
LDI r2, 111
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
