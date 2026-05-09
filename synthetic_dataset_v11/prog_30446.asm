; DESCRIPTION: Draws a yellow line from (83, 124) to (136, 164).
; PLAN: r0=83(x1), r1=124(y1), r2=136(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 124
LDI r2, 136
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
