; DESCRIPTION: Draws a white rectangle at (362, 198) with width 101 and height 27.
; PLAN: r0=362(x), r1=198(y), r2=101(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 198
LDI r2, 101
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
