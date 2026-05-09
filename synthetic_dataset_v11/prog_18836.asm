; DESCRIPTION: Composite: . Then Renders a black line between points (33, 19) and (143, 33). Then Renders a yellow disk with center (210, 124) and radius 23.
; PLAN: r0=33(x1), r1=19(y1), r2=143(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=210(x), r1=124(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black line between points (33, 19) and (143, 33).
; PLAN: r0=33(x1), r1=19(y1), r2=143(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 19
LDI r2, 143
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (210, 124) and radius 23.
; PLAN: r0=210(x), r1=124(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 124
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
