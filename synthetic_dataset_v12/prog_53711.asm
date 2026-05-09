; DESCRIPTION: Composite: Renders a red line between points (200, 136) and (308, 82) then Places a green dot at position (508, 14).
; PLAN: r0=200(x1), r1=136(y1), r2=308(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=508(x), r6=14(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 200
LDI r1, 136
LDI r2, 308
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 508
LDI r6, 14
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
