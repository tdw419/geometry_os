; DESCRIPTION: Composite: . Then Renders a green line between points (116, 170) and (211, 163). Then Creates a green circular shape at (133, 167) with radius 63.
; PLAN: r0=116(x1), r1=170(y1), r2=211(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=133(x), r1=167(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a green line between points (116, 170) and (211, 163).
; PLAN: r0=116(x1), r1=170(y1), r2=211(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 170
LDI r2, 211
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green circular shape at (133, 167) with radius 63.
; PLAN: r0=133(x), r1=167(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 167
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
