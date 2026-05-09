; DESCRIPTION: Composite: Renders a blue line between points (68, 50) and (130, 107) then Places a purple dot at position (126, 19).
; PLAN: r0=68(x1), r1=50(y1), r2=130(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=19(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 68
LDI r1, 50
LDI r2, 130
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 19
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
