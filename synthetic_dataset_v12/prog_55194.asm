; DESCRIPTION: Draws a purple line from (124, 149) to (87, 164).
; PLAN: r0=124(x1), r1=149(y1), r2=87(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 149
LDI r2, 87
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
