; DESCRIPTION: Composite: Renders a purple line between points (309, 97) and (27, 11) then Places a black dot at position (346, 44).
; PLAN: r0=309(x1), r1=97(y1), r2=27(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=346(x), r6=44(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 309
LDI r1, 97
LDI r2, 27
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 44
LDI r7, 0x000000
PSET r5, r6, r7
HALT
