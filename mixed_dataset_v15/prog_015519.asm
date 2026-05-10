; DESCRIPTION: Composite: Renders a orange line between points (4, 121) and (204, 221) then Places a orange dot at position (82, 160).
; PLAN: r0=4(x1), r1=121(y1), r2=204(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=82(x), r6=160(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 4
LDI r1, 121
LDI r2, 204
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 160
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
