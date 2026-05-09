; DESCRIPTION: Composite: Places a cyan line segment connecting (90, 148) to (377, 155) then Renders a yellow disk with center (91, 219) and radius 27.
; PLAN: r0=90(x1), r1=148(y1), r2=377(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=91(x), r6=219(y), r7=27(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 90
LDI r1, 148
LDI r2, 377
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 219
LDI r7, 27
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
