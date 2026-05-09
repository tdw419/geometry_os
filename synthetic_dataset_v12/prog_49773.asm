; DESCRIPTION: Composite: Renders a orange line between points (350, 40) and (363, 142) then Places a black dot at position (400, 32).
; PLAN: r0=350(x1), r1=40(y1), r2=363(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=400(x), r6=32(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 350
LDI r1, 40
LDI r2, 363
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 32
LDI r7, 0x000000
PSET r5, r6, r7
HALT
