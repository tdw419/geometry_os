; DESCRIPTION: Draws a red rectangle at (329, 161) with width 106 and height 78.
; PLAN: r0=329(x), r1=161(y), r2=106(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 161
LDI r2, 106
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
