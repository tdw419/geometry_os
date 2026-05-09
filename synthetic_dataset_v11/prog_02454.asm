; DESCRIPTION: Draws a green line from (201, 31) to (46, 18).
; PLAN: r0=201(x1), r1=31(y1), r2=46(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 31
LDI r2, 46
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
