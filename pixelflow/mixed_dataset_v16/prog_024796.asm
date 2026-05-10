; DESCRIPTION: Composite: Places a white line segment connecting (343, 209) to (222, 132) then Places a purple dot at position (341, 226).
; PLAN: r0=343(x1), r1=209(y1), r2=222(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=341(x), r6=226(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 343
LDI r1, 209
LDI r2, 222
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 226
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
