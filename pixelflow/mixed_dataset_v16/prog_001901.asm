; DESCRIPTION: Composite: Sets a single orange pixel at (149, 10) then Creates a green circular shape at (422, 180) with radius 76 then Renders a green line between points (239, 227) and (70, 244).
; PLAN: r0=149(x), r1=10(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=422(x), r6=180(y), r7=76(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=239(x1), r11=227(y1), r12=70(x2), r13=244(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 149
LDI r1, 10
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 422
LDI r6, 180
LDI r7, 76
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 239
LDI r11, 227
LDI r12, 70
LDI r13, 244
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
