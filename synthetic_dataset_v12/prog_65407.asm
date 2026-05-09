; DESCRIPTION: Composite: Renders a blue line between points (306, 128) and (362, 251) then Renders a black disk with center (240, 92) and radius 46.
; PLAN: r0=306(x1), r1=128(y1), r2=362(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=240(x), r6=92(y), r7=46(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 306
LDI r1, 128
LDI r2, 362
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 92
LDI r7, 46
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
