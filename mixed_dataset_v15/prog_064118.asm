; DESCRIPTION: Draws a purple line from (422, 127) to (165, 200).
; PLAN: r0=422(x1), r1=127(y1), r2=165(x2), r3=200(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 127
LDI r2, 165
LDI r3, 200
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
