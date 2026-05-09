; DESCRIPTION: Draws a yellow line from (409, 229) to (444, 87).
; PLAN: r0=409(x1), r1=229(y1), r2=444(x2), r3=87(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 229
LDI r2, 444
LDI r3, 87
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
