; DESCRIPTION: Draws a red rectangle at (355, 105) with width 44 and height 95.
; PLAN: r0=355(x), r1=105(y), r2=44(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 105
LDI r2, 44
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
