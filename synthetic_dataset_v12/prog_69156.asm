; DESCRIPTION: Composite: Draws a black line from (211, 121) to (244, 90) then Renders a yellow disk with center (313, 185) and radius 51.
; PLAN: r0=211(x1), r1=121(y1), r2=244(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=313(x), r6=185(y), r7=51(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 211
LDI r1, 121
LDI r2, 244
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 185
LDI r7, 51
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
