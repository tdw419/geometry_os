; DESCRIPTION: Draws a red rectangle at (411, 72) with width 84 and height 107.
; PLAN: r0=411(x), r1=72(y), r2=84(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 72
LDI r2, 84
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
