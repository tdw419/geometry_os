; DESCRIPTION: Renders a purple line between points (73, 197) and (162, 33).
; PLAN: r0=73(x1), r1=197(y1), r2=162(x2), r3=33(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 197
LDI r2, 162
LDI r3, 33
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
