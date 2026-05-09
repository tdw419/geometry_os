; DESCRIPTION: Composite: Places a blue line segment connecting (163, 237) to (325, 98) then Places a cyan dot at position (450, 157).
; PLAN: r0=163(x1), r1=237(y1), r2=325(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=450(x), r6=157(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 163
LDI r1, 237
LDI r2, 325
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 157
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
