; DESCRIPTION: Composite: Renders a orange line between points (482, 173) and (264, 44) then Creates a yellow circular shape at (441, 163) with radius 10.
; PLAN: r0=482(x1), r1=173(y1), r2=264(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=441(x), r6=163(y), r7=10(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 482
LDI r1, 173
LDI r2, 264
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 163
LDI r7, 10
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
