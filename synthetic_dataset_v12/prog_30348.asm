; DESCRIPTION: Composite: Renders a magenta line between points (50, 17) and (383, 110) then Sets a single purple pixel at (29, 32).
; PLAN: r0=50(x1), r1=17(y1), r2=383(x2), r3=110(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=29(x), r6=32(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 50
LDI r1, 17
LDI r2, 383
LDI r3, 110
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 32
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
