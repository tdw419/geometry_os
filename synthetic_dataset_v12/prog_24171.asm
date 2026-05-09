; DESCRIPTION: Composite: Places a red dot at position (199, 13) then Renders a cyan line between points (2, 29) and (212, 33) then Places a black circle of radius 66 at center (115, 143).
; PLAN: r0=199(x), r1=13(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=2(x1), r6=29(y1), r7=212(x2), r8=33(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=115(x), r11=143(y), r12=66(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 199
LDI r1, 13
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 2
LDI r6, 29
LDI r7, 212
LDI r8, 33
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 115
LDI r11, 143
LDI r12, 66
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
