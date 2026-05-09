; DESCRIPTION: Draws a white line from (36, 201) to (416, 214).
; PLAN: r0=36(x1), r1=201(y1), r2=416(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 201
LDI r2, 416
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
