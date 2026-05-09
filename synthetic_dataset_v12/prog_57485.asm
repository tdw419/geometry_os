; DESCRIPTION: Draws a yellow rectangle at (241, 79) with width 51 and height 103.
; PLAN: r0=241(x), r1=79(y), r2=51(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 79
LDI r2, 51
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
