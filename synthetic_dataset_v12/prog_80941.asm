; DESCRIPTION: Draws a red rectangle at (205, 93) with width 94 and height 90.
; PLAN: r0=205(x), r1=93(y), r2=94(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 93
LDI r2, 94
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
