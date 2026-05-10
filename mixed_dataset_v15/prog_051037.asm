; DESCRIPTION: Composite: Places a orange dot at position (474, 62) then Places a yellow circle of radius 22 at center (268, 170) then Renders a black line between points (269, 69) and (213, 162).
; PLAN: r0=474(x), r1=62(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=268(x), r6=170(y), r7=22(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=269(x1), r11=69(y1), r12=213(x2), r13=162(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 474
LDI r1, 62
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 268
LDI r6, 170
LDI r7, 22
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 269
LDI r11, 69
LDI r12, 213
LDI r13, 162
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
