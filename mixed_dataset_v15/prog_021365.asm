; DESCRIPTION: Composite: Renders a purple line between points (402, 164) and (381, 66) then Renders a white disk with center (453, 173) and radius 47.
; PLAN: r0=402(x1), r1=164(y1), r2=381(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=453(x), r6=173(y), r7=47(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 402
LDI r1, 164
LDI r2, 381
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 173
LDI r7, 47
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
