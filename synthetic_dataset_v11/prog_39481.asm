; DESCRIPTION: Draws a yellow rectangle at (27, 51) with width 32 and height 90.
; PLAN: r0=27(x), r1=51(y), r2=32(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 51
LDI r2, 32
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
