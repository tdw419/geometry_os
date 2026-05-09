; DESCRIPTION: Composite: Renders a red line between points (131, 8) and (80, 178) then Places a orange dot at position (429, 123).
; PLAN: r0=131(x1), r1=8(y1), r2=80(x2), r3=178(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=429(x), r6=123(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 131
LDI r1, 8
LDI r2, 80
LDI r3, 178
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 123
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
