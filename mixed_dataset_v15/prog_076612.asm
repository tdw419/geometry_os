; DESCRIPTION: Composite: Places a purple line segment connecting (449, 108) to (400, 78) then Places a red dot at position (63, 78).
; PLAN: r0=449(x1), r1=108(y1), r2=400(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=63(x), r6=78(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 449
LDI r1, 108
LDI r2, 400
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 78
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
