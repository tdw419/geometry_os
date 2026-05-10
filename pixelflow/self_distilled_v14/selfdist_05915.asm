; DESCRIPTION: Draws a red rectangle at (91, 138) with width 34 and height 109.
; PLAN: r0=91(x), r1=138(y), r2=34(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 138
LDI r2, 34
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
