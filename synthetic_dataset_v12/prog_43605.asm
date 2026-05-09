; DESCRIPTION: Draws a white line from (274, 34) to (502, 145).
; PLAN: r0=274(x1), r1=34(y1), r2=502(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 34
LDI r2, 502
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
