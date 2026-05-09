; DESCRIPTION: Draws a red rectangle at (129, 127) with width 51 and height 117.
; PLAN: r0=129(x), r1=127(y), r2=51(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 127
LDI r2, 51
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
