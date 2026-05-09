; DESCRIPTION: Composite: Renders a red line between points (155, 205) and (263, 20) then Places a purple dot at position (505, 71).
; PLAN: r0=155(x1), r1=205(y1), r2=263(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=505(x), r6=71(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 155
LDI r1, 205
LDI r2, 263
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 505
LDI r6, 71
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
