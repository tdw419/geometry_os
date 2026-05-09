; DESCRIPTION: Composite: Places a black dot at position (451, 1) then Places a magenta circle of radius 61 at center (444, 153) then Renders a purple line between points (245, 152) and (449, 47).
; PLAN: r0=451(x), r1=1(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=444(x), r6=153(y), r7=61(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=245(x1), r11=152(y1), r12=449(x2), r13=47(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 451
LDI r1, 1
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 444
LDI r6, 153
LDI r7, 61
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 245
LDI r11, 152
LDI r12, 449
LDI r13, 47
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
