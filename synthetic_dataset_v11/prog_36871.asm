; DESCRIPTION: Composite: . Then Renders a black line between points (221, 40) and (90, 6). Then Renders a yellow disk with center (54, 220) and radius 11.
; PLAN: r0=221(x1), r1=40(y1), r2=90(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=54(x), r1=220(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black line between points (221, 40) and (90, 6).
; PLAN: r0=221(x1), r1=40(y1), r2=90(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 40
LDI r2, 90
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (54, 220) and radius 11.
; PLAN: r0=54(x), r1=220(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 220
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
