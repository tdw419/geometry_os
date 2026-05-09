; DESCRIPTION: Composite: Renders a orange line between points (474, 81) and (381, 180) then Places a yellow dot at position (416, 159).
; PLAN: r0=474(x1), r1=81(y1), r2=381(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=416(x), r6=159(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 474
LDI r1, 81
LDI r2, 381
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 159
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
