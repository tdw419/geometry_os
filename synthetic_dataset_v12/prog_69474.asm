; DESCRIPTION: Composite: Renders a yellow line between points (126, 66) and (139, 244) then Sets a single white pixel at (279, 252).
; PLAN: r0=126(x1), r1=66(y1), r2=139(x2), r3=244(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=279(x), r6=252(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 126
LDI r1, 66
LDI r2, 139
LDI r3, 244
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 252
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
