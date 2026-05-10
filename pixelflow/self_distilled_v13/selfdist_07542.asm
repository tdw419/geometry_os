; DESCRIPTION: Draws a yellow line from (193, 45) to (33, 185).
; PLAN: r0=193(x1), r1=45(y1), r2=33(x2), r3=185(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 45
LDI r2, 33
LDI r3, 185
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
