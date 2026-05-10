; DESCRIPTION: Composite: Places a purple dot at position (355, 193) then Renders a blue line between points (257, 254) and (140, 240).
; PLAN: r0=355(x), r1=193(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=257(x1), r6=254(y1), r7=140(x2), r8=240(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 355
LDI r1, 193
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 257
LDI r6, 254
LDI r7, 140
LDI r8, 240
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
