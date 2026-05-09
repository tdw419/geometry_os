; DESCRIPTION: Draws a yellow rectangle at (111, 58) with width 48 and height 51.
; PLAN: r0=111(x), r1=58(y), r2=48(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 58
LDI r2, 48
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
