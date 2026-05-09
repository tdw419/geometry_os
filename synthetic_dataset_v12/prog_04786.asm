; DESCRIPTION: Draws a red rectangle at (223, 74) with width 114 and height 36.
; PLAN: r0=223(x), r1=74(y), r2=114(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 74
LDI r2, 114
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
