; DESCRIPTION: Composite: Places a black line segment connecting (145, 10) to (450, 121) then Sets a single red pixel at (270, 108).
; PLAN: r0=145(x1), r1=10(y1), r2=450(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=108(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 145
LDI r1, 10
LDI r2, 450
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 108
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
