; DESCRIPTION: Composite: Places a white dot at position (498, 3) then Places a white line segment connecting (338, 82) to (482, 122) then Renders a white disk with center (289, 206) and radius 13.
; PLAN: r0=498(x), r1=3(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=338(x1), r6=82(y1), r7=482(x2), r8=122(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=289(x), r11=206(y), r12=13(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 498
LDI r1, 3
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 338
LDI r6, 82
LDI r7, 482
LDI r8, 122
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 289
LDI r11, 206
LDI r12, 13
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
