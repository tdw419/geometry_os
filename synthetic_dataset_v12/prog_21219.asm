; DESCRIPTION: Composite: Creates a magenta circular shape at (308, 104) with radius 74 then Places a yellow dot at position (410, 87) then Renders a purple line between points (303, 20) and (249, 79).
; PLAN: r0=308(x), r1=104(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=410(x), r6=87(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=303(x1), r11=20(y1), r12=249(x2), r13=79(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 104
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 410
LDI r6, 87
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 303
LDI r11, 20
LDI r12, 249
LDI r13, 79
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
