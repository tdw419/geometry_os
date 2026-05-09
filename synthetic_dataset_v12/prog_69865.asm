; DESCRIPTION: Composite: Places a black line segment connecting (56, 138) to (79, 70) then Sets a single white pixel at (291, 230) then Renders a yellow disk with center (445, 129) and radius 15.
; PLAN: r0=56(x1), r1=138(y1), r2=79(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=291(x), r6=230(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=445(x), r11=129(y), r12=15(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 56
LDI r1, 138
LDI r2, 79
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 230
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 445
LDI r11, 129
LDI r12, 15
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
