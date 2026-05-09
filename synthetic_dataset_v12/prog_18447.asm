; DESCRIPTION: Renders a yellow line between points (422, 245) and (263, 114).
; PLAN: r0=422(x1), r1=245(y1), r2=263(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 245
LDI r2, 263
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
