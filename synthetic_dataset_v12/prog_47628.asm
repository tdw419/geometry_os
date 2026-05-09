; DESCRIPTION: Composite: Renders a magenta line between points (57, 130) and (505, 227) then Sets a single purple pixel at (256, 106).
; PLAN: r0=57(x1), r1=130(y1), r2=505(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=256(x), r6=106(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 57
LDI r1, 130
LDI r2, 505
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 106
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
