; DESCRIPTION: Composite: Renders a purple line between points (249, 209) and (309, 77) then Places a orange dot at position (436, 71).
; PLAN: r0=249(x1), r1=209(y1), r2=309(x2), r3=77(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=436(x), r6=71(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 249
LDI r1, 209
LDI r2, 309
LDI r3, 77
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 71
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
