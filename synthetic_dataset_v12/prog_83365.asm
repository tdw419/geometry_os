; DESCRIPTION: Draws a white line from (490, 204) to (253, 214).
; PLAN: r0=490(x1), r1=204(y1), r2=253(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 204
LDI r2, 253
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
