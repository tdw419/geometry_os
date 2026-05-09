; DESCRIPTION: Composite: . Then Places a green line segment connecting (66, 184) to (92, 163). Then Sets a single white pixel at (155, 130).
; PLAN: r0=66(x1), r1=184(y1), r2=92(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=155(x), r1=130(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green line segment connecting (66, 184) to (92, 163).
; PLAN: r0=66(x1), r1=184(y1), r2=92(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 184
LDI r2, 92
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (155, 130).
; PLAN: r0=155(x), r1=130(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 155
LDI r1, 130
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
