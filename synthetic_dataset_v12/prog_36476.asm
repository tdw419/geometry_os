; DESCRIPTION: Draws a yellow line from (77, 121) to (422, 60).
; PLAN: r0=77(x1), r1=121(y1), r2=422(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 121
LDI r2, 422
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
