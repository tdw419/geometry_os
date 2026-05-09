; DESCRIPTION: Composite: . Then Places a blue dot at position (188, 26). Then Renders a purple line between points (61, 56) and (154, 109).
; PLAN: r0=188(x), r1=26(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=61(x1), r1=56(y1), r2=154(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (188, 26).
; PLAN: r0=188(x), r1=26(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 188
LDI r1, 26
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a purple line between points (61, 56) and (154, 109).
; PLAN: r0=61(x1), r1=56(y1), r2=154(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 56
LDI r2, 154
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
