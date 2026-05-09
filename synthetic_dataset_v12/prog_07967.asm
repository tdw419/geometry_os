; DESCRIPTION: Composite: Renders a blue line between points (474, 56) and (23, 150) then Sets a single red pixel at (364, 212).
; PLAN: r0=474(x1), r1=56(y1), r2=23(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=364(x), r6=212(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 474
LDI r1, 56
LDI r2, 23
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 212
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
