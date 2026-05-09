; DESCRIPTION: Draws a red rectangle at (118, 74) with width 48 and height 117.
; PLAN: r0=118(x), r1=74(y), r2=48(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 74
LDI r2, 48
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
