; DESCRIPTION: Composite: Renders a green line between points (448, 148) and (328, 224) then Sets a single green pixel at (428, 50).
; PLAN: r0=448(x1), r1=148(y1), r2=328(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=428(x), r6=50(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 448
LDI r1, 148
LDI r2, 328
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 50
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
