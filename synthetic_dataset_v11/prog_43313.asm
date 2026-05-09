; DESCRIPTION: Composite: . Then Places a yellow dot at position (86, 222). Then Places a yellow line segment connecting (88, 21) to (19, 170).
; PLAN: r0=86(x), r1=222(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=88(x1), r1=21(y1), r2=19(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (86, 222).
; PLAN: r0=86(x), r1=222(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 86
LDI r1, 222
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Places a yellow line segment connecting (88, 21) to (19, 170).
; PLAN: r0=88(x1), r1=21(y1), r2=19(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 21
LDI r2, 19
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
