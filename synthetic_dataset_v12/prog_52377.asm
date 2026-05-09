; DESCRIPTION: Draws a orange rectangle at (51, 177) with width 113 and height 72.
; PLAN: r0=51(x), r1=177(y), r2=113(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 177
LDI r2, 113
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
