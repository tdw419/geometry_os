; DESCRIPTION: Composite: Renders a yellow line between points (172, 223) and (323, 250) then Places a cyan dot at position (139, 142) then Renders a white disk with center (354, 196) and radius 57.
; PLAN: r0=172(x1), r1=223(y1), r2=323(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=139(x), r6=142(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=354(x), r11=196(y), r12=57(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 172
LDI r1, 223
LDI r2, 323
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 142
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 354
LDI r11, 196
LDI r12, 57
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
