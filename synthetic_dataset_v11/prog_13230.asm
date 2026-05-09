; DESCRIPTION: Renders a blue line between points (196, 61) and (195, 221).
; PLAN: r0=196(x1), r1=61(y1), r2=195(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 61
LDI r2, 195
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
