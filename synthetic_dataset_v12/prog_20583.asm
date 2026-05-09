; DESCRIPTION: Composite: Renders a white line between points (409, 57) and (87, 58) then Places a yellow dot at position (13, 93).
; PLAN: r0=409(x1), r1=57(y1), r2=87(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=13(x), r6=93(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 409
LDI r1, 57
LDI r2, 87
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 13
LDI r6, 93
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
