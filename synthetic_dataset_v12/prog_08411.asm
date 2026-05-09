; DESCRIPTION: Renders a purple line between points (113, 23) and (508, 208).
; PLAN: r0=113(x1), r1=23(y1), r2=508(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 23
LDI r2, 508
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
