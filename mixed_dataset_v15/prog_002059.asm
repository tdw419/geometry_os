; DESCRIPTION: Draws a red rectangle at (47, 0) with width 31 and height 107.
; PLAN: r0=47(x), r1=0(y), r2=31(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 0
LDI r2, 31
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
