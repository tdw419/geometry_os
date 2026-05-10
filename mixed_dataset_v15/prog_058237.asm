; DESCRIPTION: Draws a red rectangle at (334, 138) with width 68 and height 58.
; PLAN: r0=334(x), r1=138(y), r2=68(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 138
LDI r2, 68
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
