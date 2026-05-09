; DESCRIPTION: Draws a red rectangle at (208, 28) with width 22 and height 109.
; PLAN: r0=208(x), r1=28(y), r2=22(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 28
LDI r2, 22
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
