; DESCRIPTION: Composite: Renders a purple disk with center (393, 96) and radius 66 then Places a red dot at position (281, 69) then Places a orange line segment connecting (234, 4) to (453, 90).
; PLAN: r0=393(x), r1=96(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=281(x), r6=69(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=234(x1), r11=4(y1), r12=453(x2), r13=90(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 393
LDI r1, 96
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 281
LDI r6, 69
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 234
LDI r11, 4
LDI r12, 453
LDI r13, 90
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
