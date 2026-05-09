; DESCRIPTION: Composite: Renders a orange line between points (72, 153) and (323, 26) then Places a yellow dot at position (42, 79).
; PLAN: r0=72(x1), r1=153(y1), r2=323(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=42(x), r6=79(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 72
LDI r1, 153
LDI r2, 323
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 79
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
