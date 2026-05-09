; DESCRIPTION: Composite: Places a yellow dot at position (327, 221) then Creates a white circular shape at (390, 95) with radius 77 then Renders a magenta line between points (495, 189) and (279, 31).
; PLAN: r0=327(x), r1=221(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=390(x), r6=95(y), r7=77(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=495(x1), r11=189(y1), r12=279(x2), r13=31(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 327
LDI r1, 221
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 390
LDI r6, 95
LDI r7, 77
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 495
LDI r11, 189
LDI r12, 279
LDI r13, 31
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
