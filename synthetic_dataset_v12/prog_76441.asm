; DESCRIPTION: Draws a white line from (422, 226) to (455, 129).
; PLAN: r0=422(x1), r1=226(y1), r2=455(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 226
LDI r2, 455
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
