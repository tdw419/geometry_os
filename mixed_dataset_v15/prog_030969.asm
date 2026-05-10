; DESCRIPTION: Draws a red rectangle at (120, 94) with width 89 and height 31.
; PLAN: r0=120(x), r1=94(y), r2=89(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 94
LDI r2, 89
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
