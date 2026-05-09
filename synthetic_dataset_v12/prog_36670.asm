; DESCRIPTION: Composite: Renders a red line between points (231, 219) and (338, 189) then Places a yellow dot at position (270, 142).
; PLAN: r0=231(x1), r1=219(y1), r2=338(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=142(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 231
LDI r1, 219
LDI r2, 338
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 142
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
