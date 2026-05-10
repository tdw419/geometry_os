; DESCRIPTION: Composite: Places a green line segment connecting (147, 234) to (442, 63) then Sets a single orange pixel at (203, 94).
; PLAN: r0=147(x1), r1=234(y1), r2=442(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=203(x), r6=94(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 147
LDI r1, 234
LDI r2, 442
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 94
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
