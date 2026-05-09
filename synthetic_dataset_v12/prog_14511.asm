; DESCRIPTION: Draws a green line from (9, 63) to (211, 160).
; PLAN: r0=9(x1), r1=63(y1), r2=211(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 63
LDI r2, 211
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
