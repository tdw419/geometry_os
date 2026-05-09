; DESCRIPTION: Composite: Renders a magenta line between points (463, 0) and (18, 84) then Draws a orange circle centered at (238, 51) with radius 43 then Sets a single yellow pixel at (511, 158).
; PLAN: r0=463(x1), r1=0(y1), r2=18(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=238(x), r6=51(y), r7=43(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=511(x), r11=158(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 463
LDI r1, 0
LDI r2, 18
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 51
LDI r7, 43
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 511
LDI r11, 158
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
