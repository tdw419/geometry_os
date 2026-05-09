; DESCRIPTION: Draws a blue line from (387, 201) to (25, 249).
; PLAN: r0=387(x1), r1=201(y1), r2=25(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 201
LDI r2, 25
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
