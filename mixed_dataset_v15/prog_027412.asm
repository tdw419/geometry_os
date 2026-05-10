; DESCRIPTION: Draws a black line from (422, 75) to (487, 216).
; PLAN: r0=422(x1), r1=75(y1), r2=487(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 75
LDI r2, 487
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
