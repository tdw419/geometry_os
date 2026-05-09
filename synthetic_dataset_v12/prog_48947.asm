; DESCRIPTION: Composite: Renders a yellow disk with center (399, 125) and radius 34 then Sets a single cyan pixel at (422, 10) then Renders a blue line between points (133, 59) and (296, 77).
; PLAN: r0=399(x), r1=125(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=422(x), r6=10(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=133(x1), r11=59(y1), r12=296(x2), r13=77(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 399
LDI r1, 125
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 422
LDI r6, 10
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 133
LDI r11, 59
LDI r12, 296
LDI r13, 77
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
