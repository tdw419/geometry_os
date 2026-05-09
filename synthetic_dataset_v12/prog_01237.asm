; DESCRIPTION: Renders a blue line between points (156, 132) and (469, 221).
; PLAN: r0=156(x1), r1=132(y1), r2=469(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 132
LDI r2, 469
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
