; DESCRIPTION: Draws a red rectangle at (401, 106) with width 78 and height 118.
; PLAN: r0=401(x), r1=106(y), r2=78(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 106
LDI r2, 78
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
