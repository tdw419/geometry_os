; DESCRIPTION: Draws a purple line from (165, 124) to (149, 177).
; PLAN: r0=165(x1), r1=124(y1), r2=149(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 124
LDI r2, 149
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
