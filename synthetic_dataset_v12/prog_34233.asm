; DESCRIPTION: Composite: Places a black line segment connecting (339, 37) to (333, 171) then Renders a black disk with center (236, 184) and radius 51.
; PLAN: r0=339(x1), r1=37(y1), r2=333(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=236(x), r6=184(y), r7=51(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 339
LDI r1, 37
LDI r2, 333
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 184
LDI r7, 51
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
