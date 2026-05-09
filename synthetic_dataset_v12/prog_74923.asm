; DESCRIPTION: Composite: Renders a orange disk with center (259, 123) and radius 61 then Draws a orange line from (362, 85) to (396, 130) then Sets a single purple pixel at (323, 196).
; PLAN: r0=259(x), r1=123(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=362(x1), r6=85(y1), r7=396(x2), r8=130(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=323(x), r11=196(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 259
LDI r1, 123
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 362
LDI r6, 85
LDI r7, 396
LDI r8, 130
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 323
LDI r11, 196
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
