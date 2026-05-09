; DESCRIPTION: Composite: Places a cyan circle of radius 56 at center (112, 73) then Renders a magenta line between points (298, 227) and (417, 170) then Places a black dot at position (508, 155).
; PLAN: r0=112(x), r1=73(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=298(x1), r6=227(y1), r7=417(x2), r8=170(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=508(x), r11=155(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 112
LDI r1, 73
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 298
LDI r6, 227
LDI r7, 417
LDI r8, 170
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 508
LDI r11, 155
LDI r12, 0x000000
PSET r10, r11, r12
HALT
