; DESCRIPTION: Draws a red rectangle at (170, 98) with width 19 and height 110.
; PLAN: r0=170(x), r1=98(y), r2=19(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 98
LDI r2, 19
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
