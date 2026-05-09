; DESCRIPTION: Draws a red rectangle at (140, 167) with width 109 and height 33.
; PLAN: r0=140(x), r1=167(y), r2=109(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 167
LDI r2, 109
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
