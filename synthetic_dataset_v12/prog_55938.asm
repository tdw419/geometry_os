; DESCRIPTION: Composite: Renders a magenta line between points (466, 7) and (248, 11) then Sets a single black pixel at (9, 42).
; PLAN: r0=466(x1), r1=7(y1), r2=248(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=9(x), r6=42(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 466
LDI r1, 7
LDI r2, 248
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 42
LDI r7, 0x000000
PSET r5, r6, r7
HALT
