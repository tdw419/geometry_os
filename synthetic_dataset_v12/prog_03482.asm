; DESCRIPTION: Composite: Renders a cyan line between points (138, 27) and (367, 224) then Places a yellow dot at position (386, 185) then Creates a yellow circular shape at (112, 216) with radius 11.
; PLAN: r0=138(x1), r1=27(y1), r2=367(x2), r3=224(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=386(x), r6=185(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=112(x), r11=216(y), r12=11(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 138
LDI r1, 27
LDI r2, 367
LDI r3, 224
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 185
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 112
LDI r11, 216
LDI r12, 11
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
