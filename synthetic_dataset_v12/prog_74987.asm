; DESCRIPTION: Composite: Places a purple line segment connecting (282, 0) to (287, 107) then Places a orange dot at position (60, 50).
; PLAN: r0=282(x1), r1=0(y1), r2=287(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=60(x), r6=50(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 282
LDI r1, 0
LDI r2, 287
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 50
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
