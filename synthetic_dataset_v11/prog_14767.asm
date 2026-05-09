; DESCRIPTION: Draws a red rectangle at (148, 132) with width 105 and height 39.
; PLAN: r0=148(x), r1=132(y), r2=105(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 132
LDI r2, 105
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
