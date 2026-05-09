; DESCRIPTION: Composite: . Then Renders a yellow disk with center (72, 110) and radius 60. Then Renders a black line between points (66, 149) and (222, 25).
; PLAN: r0=72(x), r1=110(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=66(x1), r1=149(y1), r2=222(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow disk with center (72, 110) and radius 60.
; PLAN: r0=72(x), r1=110(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 110
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a black line between points (66, 149) and (222, 25).
; PLAN: r0=66(x1), r1=149(y1), r2=222(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 149
LDI r2, 222
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
