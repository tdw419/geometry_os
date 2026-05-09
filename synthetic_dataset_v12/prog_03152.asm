; DESCRIPTION: Composite: Renders a white disk with center (379, 145) and radius 32 then Renders a yellow line between points (441, 7) and (446, 203).
; PLAN: r0=379(x), r1=145(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=441(x1), r6=7(y1), r7=446(x2), r8=203(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 379
LDI r1, 145
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 441
LDI r6, 7
LDI r7, 446
LDI r8, 203
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
