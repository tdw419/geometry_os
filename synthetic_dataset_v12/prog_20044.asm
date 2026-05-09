; DESCRIPTION: Draws a red rectangle at (93, 124) with width 26 and height 35.
; PLAN: r0=93(x), r1=124(y), r2=26(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 124
LDI r2, 26
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
