; DESCRIPTION: Composite: Draws a blue circle centered at (108, 130) with radius 10 then Sets a single cyan pixel at (201, 41) then Places a green line segment connecting (234, 20) to (286, 41).
; PLAN: r0=108(x), r1=130(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=201(x), r6=41(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=234(x1), r11=20(y1), r12=286(x2), r13=41(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 108
LDI r1, 130
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 201
LDI r6, 41
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 234
LDI r11, 20
LDI r12, 286
LDI r13, 41
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
