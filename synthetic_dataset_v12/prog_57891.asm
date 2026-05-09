; DESCRIPTION: Draws a green line from (422, 211) to (465, 89).
; PLAN: r0=422(x1), r1=211(y1), r2=465(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 211
LDI r2, 465
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
