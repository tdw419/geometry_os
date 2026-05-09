; DESCRIPTION: Composite: Renders a black disk with center (198, 107) and radius 43 then Renders a white line between points (222, 153) and (71, 71) then Places a magenta dot at position (264, 107).
; PLAN: r0=198(x), r1=107(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=222(x1), r6=153(y1), r7=71(x2), r8=71(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=264(x), r11=107(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 198
LDI r1, 107
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 222
LDI r6, 153
LDI r7, 71
LDI r8, 71
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 264
LDI r11, 107
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
