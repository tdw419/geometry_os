; DESCRIPTION: Composite: Renders a white disk with center (214, 128) and radius 23 then Places a blue dot at position (383, 27) then Places a yellow line segment connecting (194, 84) to (123, 80).
; PLAN: r0=214(x), r1=128(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=383(x), r6=27(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=194(x1), r11=84(y1), r12=123(x2), r13=80(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 214
LDI r1, 128
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 383
LDI r6, 27
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 194
LDI r11, 84
LDI r12, 123
LDI r13, 80
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
