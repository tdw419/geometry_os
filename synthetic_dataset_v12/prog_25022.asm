; DESCRIPTION: Composite: Places a orange dot at position (372, 83) then Renders a yellow line between points (90, 194) and (82, 73).
; PLAN: r0=372(x), r1=83(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=90(x1), r6=194(y1), r7=82(x2), r8=73(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 83
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 90
LDI r6, 194
LDI r7, 82
LDI r8, 73
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
