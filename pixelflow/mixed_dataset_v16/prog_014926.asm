; DESCRIPTION: Composite: Sets a single blue pixel at (423, 12) then Draws a black line from (63, 111) to (10, 172) then Renders a orange disk with center (439, 127) and radius 19.
; PLAN: r0=423(x), r1=12(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=63(x1), r6=111(y1), r7=10(x2), r8=172(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=439(x), r11=127(y), r12=19(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 423
LDI r1, 12
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 63
LDI r6, 111
LDI r7, 10
LDI r8, 172
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 439
LDI r11, 127
LDI r12, 19
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
