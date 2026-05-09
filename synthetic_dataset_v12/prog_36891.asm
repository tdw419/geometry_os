; DESCRIPTION: Draws a blue line from (193, 251) to (21, 124).
; PLAN: r0=193(x1), r1=251(y1), r2=21(x2), r3=124(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 251
LDI r2, 21
LDI r3, 124
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
