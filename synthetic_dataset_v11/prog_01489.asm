; DESCRIPTION: Draws a red rectangle at (48, 134) with width 52 and height 110.
; PLAN: r0=48(x), r1=134(y), r2=52(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 134
LDI r2, 52
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
