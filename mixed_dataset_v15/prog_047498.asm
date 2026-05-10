; DESCRIPTION: Composite: Places a green circle of radius 37 at center (436, 156) then Places a purple 35x53 rectangle at position (305, 52) then Renders a black line between points (235, 31) and (171, 19).
; PLAN: r0=436(x), r1=156(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=305(x), r6=52(y), r7=35(width), r8=53(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=235(x1), r11=31(y1), r12=171(x2), r13=19(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 436
LDI r1, 156
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 305
LDI r6, 52
LDI r7, 35
LDI r8, 53
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 235
LDI r11, 31
LDI r12, 171
LDI r13, 19
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
