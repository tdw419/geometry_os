; DESCRIPTION: Composite: Renders a green line between points (287, 225) and (329, 38) then Sets a single cyan pixel at (318, 53).
; PLAN: r0=287(x1), r1=225(y1), r2=329(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=53(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 287
LDI r1, 225
LDI r2, 329
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 53
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
