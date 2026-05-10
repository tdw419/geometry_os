; DESCRIPTION: Composite: Sets a single black pixel at (510, 140) then Places a black circle of radius 19 at center (49, 196) then Renders a white line between points (386, 49) and (132, 56).
; PLAN: r0=510(x), r1=140(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=49(x), r6=196(y), r7=19(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=386(x1), r11=49(y1), r12=132(x2), r13=56(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 510
LDI r1, 140
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 49
LDI r6, 196
LDI r7, 19
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 386
LDI r11, 49
LDI r12, 132
LDI r13, 56
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
