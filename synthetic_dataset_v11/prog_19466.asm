; DESCRIPTION: Renders a yellow line between points (90, 166) and (201, 195).
; PLAN: r0=90(x1), r1=166(y1), r2=201(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 166
LDI r2, 201
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
