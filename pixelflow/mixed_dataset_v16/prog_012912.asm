; DESCRIPTION: Composite: Places a white circle of radius 80 at center (80, 145) then Places a purple dot at position (354, 155) then Renders a white box of size 91x15 starting at (351, 47).
; PLAN: r0=80(x), r1=145(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=354(x), r6=155(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=351(x), r11=47(y), r12=91(width), r13=15(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 80
LDI r1, 145
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 354
LDI r6, 155
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 351
LDI r11, 47
LDI r12, 91
LDI r13, 15
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
