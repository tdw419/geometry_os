; DESCRIPTION: Draws a white rectangle at (127, 167) with width 51 and height 61.
; PLAN: r0=127(x), r1=167(y), r2=51(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 167
LDI r2, 51
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
