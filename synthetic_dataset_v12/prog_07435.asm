; DESCRIPTION: Draws a red rectangle at (179, 93) with width 19 and height 38.
; PLAN: r0=179(x), r1=93(y), r2=19(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 93
LDI r2, 19
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
