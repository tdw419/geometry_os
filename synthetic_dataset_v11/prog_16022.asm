; DESCRIPTION: Composite: . Then Sets a single green pixel at (88, 202). Then Places a yellow line segment connecting (111, 17) to (182, 52).
; PLAN: r0=88(x), r1=202(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=111(x1), r1=17(y1), r2=182(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (88, 202).
; PLAN: r0=88(x), r1=202(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 88
LDI r1, 202
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a yellow line segment connecting (111, 17) to (182, 52).
; PLAN: r0=111(x1), r1=17(y1), r2=182(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 17
LDI r2, 182
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
