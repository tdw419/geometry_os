; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (40, 208) to (13, 15). Then Sets a single black pixel at (173, 232).
; PLAN: r0=40(x1), r1=208(y1), r2=13(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=173(x), r1=232(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow line segment connecting (40, 208) to (13, 15).
; PLAN: r0=40(x1), r1=208(y1), r2=13(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 208
LDI r2, 13
LDI r3, 15
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (173, 232).
; PLAN: r0=173(x), r1=232(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 173
LDI r1, 232
LDI r2, 0x000000
PSET r0, r1, r2
HALT
