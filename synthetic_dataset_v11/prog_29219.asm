; DESCRIPTION: Draws a red rectangle at (160, 118) with width 27 and height 117.
; PLAN: r0=160(x), r1=118(y), r2=27(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 118
LDI r2, 27
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
