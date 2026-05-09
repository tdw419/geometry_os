; DESCRIPTION: Composite: . Then Places a yellow dot at position (11, 16). Then Places a green line segment connecting (194, 95) to (176, 17).
; PLAN: r0=11(x), r1=16(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=194(x1), r1=95(y1), r2=176(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (11, 16).
; PLAN: r0=11(x), r1=16(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 11
LDI r1, 16
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Places a green line segment connecting (194, 95) to (176, 17).
; PLAN: r0=194(x1), r1=95(y1), r2=176(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 95
LDI r2, 176
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
