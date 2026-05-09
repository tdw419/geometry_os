; DESCRIPTION: Composite: . Then Places a green line segment connecting (188, 12) to (204, 165). Then Places a yellow dot at position (58, 250).
; PLAN: r0=188(x1), r1=12(y1), r2=204(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=58(x), r1=250(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green line segment connecting (188, 12) to (204, 165).
; PLAN: r0=188(x1), r1=12(y1), r2=204(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 12
LDI r2, 204
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (58, 250).
; PLAN: r0=58(x), r1=250(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 58
LDI r1, 250
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
