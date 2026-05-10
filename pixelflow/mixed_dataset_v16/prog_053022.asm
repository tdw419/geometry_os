; DESCRIPTION: Composite: Renders a red line between points (268, 80) and (416, 187) then Places a orange dot at position (15, 201).
; PLAN: r0=268(x1), r1=80(y1), r2=416(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=15(x), r6=201(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 268
LDI r1, 80
LDI r2, 416
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 201
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
