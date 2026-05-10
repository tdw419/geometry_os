; DESCRIPTION: Draws a red rectangle at (326, 86) with width 118 and height 48.
; PLAN: r0=326(x), r1=86(y), r2=118(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 86
LDI r2, 118
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
