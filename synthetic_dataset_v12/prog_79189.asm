; DESCRIPTION: Composite: Places a red dot at position (434, 96) then Renders a black disk with center (264, 203) and radius 45 then Renders a black line between points (47, 239) and (357, 126).
; PLAN: r0=434(x), r1=96(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=264(x), r6=203(y), r7=45(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=47(x1), r11=239(y1), r12=357(x2), r13=126(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 434
LDI r1, 96
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 264
LDI r6, 203
LDI r7, 45
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 47
LDI r11, 239
LDI r12, 357
LDI r13, 126
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
