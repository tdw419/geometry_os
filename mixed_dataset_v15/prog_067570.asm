; DESCRIPTION: Composite: Renders a red line between points (193, 52) and (338, 71) then Draws a magenta circle centered at (430, 193) with radius 27 then Sets a single yellow pixel at (71, 127).
; PLAN: r0=193(x1), r1=52(y1), r2=338(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=430(x), r6=193(y), r7=27(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=71(x), r11=127(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 193
LDI r1, 52
LDI r2, 338
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 193
LDI r7, 27
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 71
LDI r11, 127
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
