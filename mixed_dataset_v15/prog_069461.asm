; DESCRIPTION: Draws a yellow line from (422, 165) to (470, 189).
; PLAN: r0=422(x1), r1=165(y1), r2=470(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 165
LDI r2, 470
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
