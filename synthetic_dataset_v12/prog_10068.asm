; DESCRIPTION: Composite: Places a black line segment connecting (505, 209) to (498, 19) then Places a purple dot at position (347, 64).
; PLAN: r0=505(x1), r1=209(y1), r2=498(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=347(x), r6=64(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 505
LDI r1, 209
LDI r2, 498
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 64
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
