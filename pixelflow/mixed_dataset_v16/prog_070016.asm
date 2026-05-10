; DESCRIPTION: Composite: Draws a orange line from (292, 125) to (369, 4) then Places a yellow dot at position (467, 161).
; PLAN: r0=292(x1), r1=125(y1), r2=369(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=467(x), r6=161(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 292
LDI r1, 125
LDI r2, 369
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 161
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
