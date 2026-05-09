; DESCRIPTION: Composite: Renders a orange disk with center (197, 189) and radius 47 then Places a blue dot at position (254, 12) then Places a cyan line segment connecting (430, 46) to (470, 14).
; PLAN: r0=197(x), r1=189(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=254(x), r6=12(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=430(x1), r11=46(y1), r12=470(x2), r13=14(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 189
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 254
LDI r6, 12
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 430
LDI r11, 46
LDI r12, 470
LDI r13, 14
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
