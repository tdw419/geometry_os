; DESCRIPTION: Draws a yellow line from (392, 112) to (104, 211).
; PLAN: r0=392(x1), r1=112(y1), r2=104(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 112
LDI r2, 104
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
