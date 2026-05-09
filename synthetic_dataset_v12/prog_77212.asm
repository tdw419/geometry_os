; DESCRIPTION: Composite: Renders a black line between points (196, 160) and (289, 24) then Renders a white disk with center (102, 229) and radius 19.
; PLAN: r0=196(x1), r1=160(y1), r2=289(x2), r3=24(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=102(x), r6=229(y), r7=19(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 196
LDI r1, 160
LDI r2, 289
LDI r3, 24
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 229
LDI r7, 19
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
