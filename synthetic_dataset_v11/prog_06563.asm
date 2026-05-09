; DESCRIPTION: Draws a green rectangle at (140, 133) with width 41 and height 72.
; PLAN: r0=140(x), r1=133(y), r2=41(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 133
LDI r2, 41
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
