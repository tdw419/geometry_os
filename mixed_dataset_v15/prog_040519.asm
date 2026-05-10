; DESCRIPTION: Composite: Draws a orange rectangle at (43, 133) with width 94 and height 20 then Sets a single magenta pixel at (222, 170).
; PLAN: r0=43(x), r1=133(y), r2=94(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=222(x), r6=170(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 43
LDI r1, 133
LDI r2, 94
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 170
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
