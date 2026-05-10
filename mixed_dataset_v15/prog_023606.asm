; DESCRIPTION: Composite: Renders a orange line between points (424, 45) and (194, 214) then Places a orange dot at position (442, 60).
; PLAN: r0=424(x1), r1=45(y1), r2=194(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=60(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 424
LDI r1, 45
LDI r2, 194
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 60
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
