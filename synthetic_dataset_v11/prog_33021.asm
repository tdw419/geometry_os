; DESCRIPTION: Draws a blue line from (107, 194) to (104, 124).
; PLAN: r0=107(x1), r1=194(y1), r2=104(x2), r3=124(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 194
LDI r2, 104
LDI r3, 124
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
