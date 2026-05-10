; DESCRIPTION: Composite: Places a orange dot at position (281, 232) then Renders a red line between points (129, 98) and (396, 159).
; PLAN: r0=281(x), r1=232(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=129(x1), r6=98(y1), r7=396(x2), r8=159(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 281
LDI r1, 232
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 129
LDI r6, 98
LDI r7, 396
LDI r8, 159
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
