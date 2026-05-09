; DESCRIPTION: Draws a red rectangle at (216, 176) with width 68 and height 56.
; PLAN: r0=216(x), r1=176(y), r2=68(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 176
LDI r2, 68
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
