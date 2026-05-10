; DESCRIPTION: Composite: Places a yellow dot at position (66, 217) then Places a black circle of radius 39 at center (345, 148) then Draws a black line from (192, 63) to (53, 47).
; PLAN: r0=66(x), r1=217(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=345(x), r6=148(y), r7=39(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=192(x1), r11=63(y1), r12=53(x2), r13=47(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 66
LDI r1, 217
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 345
LDI r6, 148
LDI r7, 39
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 192
LDI r11, 63
LDI r12, 53
LDI r13, 47
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
