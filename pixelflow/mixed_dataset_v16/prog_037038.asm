; DESCRIPTION: Composite: Renders a yellow disk with center (496, 222) and radius 10 then Renders a black line between points (124, 37) and (478, 188) then Renders a cyan box of size 27x47 starting at (454, 11).
; PLAN: r0=496(x), r1=222(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=124(x1), r6=37(y1), r7=478(x2), r8=188(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=454(x), r11=11(y), r12=27(width), r13=47(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 496
LDI r1, 222
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 124
LDI r6, 37
LDI r7, 478
LDI r8, 188
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 454
LDI r11, 11
LDI r12, 27
LDI r13, 47
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
