; DESCRIPTION: Composite: . Then Places a black dot at position (149, 153). Then Places a white line segment connecting (149, 130) to (17, 221).
; PLAN: r0=149(x), r1=153(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=149(x1), r1=130(y1), r2=17(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (149, 153).
; PLAN: r0=149(x), r1=153(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 149
LDI r1, 153
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a white line segment connecting (149, 130) to (17, 221).
; PLAN: r0=149(x1), r1=130(y1), r2=17(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 130
LDI r2, 17
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
