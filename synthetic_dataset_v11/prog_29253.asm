; DESCRIPTION: Draws a red rectangle at (18, 46) with width 119 and height 107.
; PLAN: r0=18(x), r1=46(y), r2=119(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 46
LDI r2, 119
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
