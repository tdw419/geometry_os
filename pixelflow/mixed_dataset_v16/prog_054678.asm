; DESCRIPTION: Composite: Renders a purple disk with center (419, 87) and radius 12 then Places a magenta line segment connecting (396, 47) to (426, 104) then Creates a black rectangular region at (417, 168) spanning 77 by 83 pixels.
; PLAN: r0=419(x), r1=87(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=396(x1), r6=47(y1), r7=426(x2), r8=104(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=417(x), r11=168(y), r12=77(width), r13=83(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 419
LDI r1, 87
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 396
LDI r6, 47
LDI r7, 426
LDI r8, 104
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 417
LDI r11, 168
LDI r12, 77
LDI r13, 83
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
