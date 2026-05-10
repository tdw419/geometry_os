; DESCRIPTION: Composite: Renders a magenta line between points (54, 203) and (508, 237) then Places a purple dot at position (32, 52).
; PLAN: r0=54(x1), r1=203(y1), r2=508(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=32(x), r6=52(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 54
LDI r1, 203
LDI r2, 508
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 52
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
