; DESCRIPTION: Composite: Places a white circle of radius 46 at center (450, 116) then Places a white dot at position (340, 58) then Renders a purple line between points (314, 30) and (462, 203).
; PLAN: r0=450(x), r1=116(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=340(x), r6=58(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=314(x1), r11=30(y1), r12=462(x2), r13=203(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 450
LDI r1, 116
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 340
LDI r6, 58
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 314
LDI r11, 30
LDI r12, 462
LDI r13, 203
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
