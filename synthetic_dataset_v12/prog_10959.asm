; DESCRIPTION: Composite: Places a orange line segment connecting (439, 109) to (404, 98) then Places a orange dot at position (99, 21).
; PLAN: r0=439(x1), r1=109(y1), r2=404(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=99(x), r6=21(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 439
LDI r1, 109
LDI r2, 404
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 21
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
