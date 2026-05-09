; DESCRIPTION: Draws a red rectangle at (413, 74) with width 89 and height 94.
; PLAN: r0=413(x), r1=74(y), r2=89(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 74
LDI r2, 89
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
