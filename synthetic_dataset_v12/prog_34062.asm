; DESCRIPTION: Renders a yellow line between points (401, 201) and (114, 196).
; PLAN: r0=401(x1), r1=201(y1), r2=114(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 201
LDI r2, 114
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
