; DESCRIPTION: Draws a red rectangle at (355, 130) with width 66 and height 109.
; PLAN: r0=355(x), r1=130(y), r2=66(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 130
LDI r2, 66
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
