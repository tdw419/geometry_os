; DESCRIPTION: Renders a green line between points (498, 150) and (130, 78).
; PLAN: r0=498(x1), r1=150(y1), r2=130(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 150
LDI r2, 130
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
