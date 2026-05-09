; DESCRIPTION: Composite: Renders a black line between points (21, 253) and (319, 141) then Creates a orange circular shape at (402, 164) with radius 29.
; PLAN: r0=21(x1), r1=253(y1), r2=319(x2), r3=141(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=164(y), r7=29(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 21
LDI r1, 253
LDI r2, 319
LDI r3, 141
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 164
LDI r7, 29
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
