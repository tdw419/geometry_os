; DESCRIPTION: Composite: Places a cyan line segment connecting (498, 81) to (180, 13) then Places a purple dot at position (414, 13).
; PLAN: r0=498(x1), r1=81(y1), r2=180(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=414(x), r6=13(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 498
LDI r1, 81
LDI r2, 180
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 13
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
