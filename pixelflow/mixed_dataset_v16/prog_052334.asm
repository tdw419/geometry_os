; DESCRIPTION: Draws a white rectangle at (362, 15) with width 115 and height 17.
; PLAN: r0=362(x), r1=15(y), r2=115(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 15
LDI r2, 115
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
