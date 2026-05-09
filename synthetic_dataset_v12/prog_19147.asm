; DESCRIPTION: Composite: Sets a single black pixel at (378, 164) then Renders a purple line between points (429, 32) and (237, 166).
; PLAN: r0=378(x), r1=164(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=429(x1), r6=32(y1), r7=237(x2), r8=166(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 164
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 429
LDI r6, 32
LDI r7, 237
LDI r8, 166
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
