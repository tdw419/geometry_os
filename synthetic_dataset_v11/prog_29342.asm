; DESCRIPTION: Places a blue line segment connecting (193, 249) to (124, 52).
; PLAN: r0=193(x1), r1=249(y1), r2=124(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 249
LDI r2, 124
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
