; DESCRIPTION: Draws a black line from (504, 201) to (201, 45).
; PLAN: r0=504(x1), r1=201(y1), r2=201(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 201
LDI r2, 201
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
