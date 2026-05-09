; DESCRIPTION: Composite: Renders a red disk with center (142, 70) and radius 63 then Places a yellow dot at position (453, 227) then Renders a white line between points (474, 109) and (224, 43).
; PLAN: r0=142(x), r1=70(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=453(x), r6=227(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=474(x1), r11=109(y1), r12=224(x2), r13=43(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 142
LDI r1, 70
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 453
LDI r6, 227
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 474
LDI r11, 109
LDI r12, 224
LDI r13, 43
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
