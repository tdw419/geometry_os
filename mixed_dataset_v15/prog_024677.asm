; DESCRIPTION: Draws a red rectangle at (237, 118) with width 23 and height 11.
; PLAN: r0=237(x), r1=118(y), r2=23(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 118
LDI r2, 23
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
