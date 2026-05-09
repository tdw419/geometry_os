; DESCRIPTION: Composite: Places a yellow line segment connecting (122, 214) to (28, 155) then Renders a purple disk with center (421, 133) and radius 70 then Places a cyan dot at position (132, 124).
; PLAN: r0=122(x1), r1=214(y1), r2=28(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=421(x), r6=133(y), r7=70(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=132(x), r11=124(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 122
LDI r1, 214
LDI r2, 28
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 133
LDI r7, 70
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 132
LDI r11, 124
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
