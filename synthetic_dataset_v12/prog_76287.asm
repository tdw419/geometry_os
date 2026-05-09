; DESCRIPTION: Composite: Renders a blue disk with center (60, 141) and radius 49 then Places a black dot at position (146, 105) then Renders a white line between points (264, 18) and (408, 7).
; PLAN: r0=60(x), r1=141(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=146(x), r6=105(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=264(x1), r11=18(y1), r12=408(x2), r13=7(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 60
LDI r1, 141
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 146
LDI r6, 105
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 264
LDI r11, 18
LDI r12, 408
LDI r13, 7
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
