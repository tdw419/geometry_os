; DESCRIPTION: Composite: Sets a single red pixel at (325, 103) then Draws a black line from (435, 99) to (453, 63).
; PLAN: r0=325(x), r1=103(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=435(x1), r6=99(y1), r7=453(x2), r8=63(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 325
LDI r1, 103
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 435
LDI r6, 99
LDI r7, 453
LDI r8, 63
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
