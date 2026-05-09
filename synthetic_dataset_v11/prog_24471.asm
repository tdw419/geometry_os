; DESCRIPTION: Composite: . Then Places a green line segment connecting (34, 21) to (163, 31). Then Places a yellow dot at position (61, 133).
; PLAN: r0=34(x1), r1=21(y1), r2=163(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=61(x), r1=133(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green line segment connecting (34, 21) to (163, 31).
; PLAN: r0=34(x1), r1=21(y1), r2=163(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 21
LDI r2, 163
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (61, 133).
; PLAN: r0=61(x), r1=133(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 61
LDI r1, 133
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
