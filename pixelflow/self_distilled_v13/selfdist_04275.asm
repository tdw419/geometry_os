; DESCRIPTION: Draws a white line from (274, 20) to (245, 110).
; PLAN: r0=274(x1), r1=20(y1), r2=245(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 20
LDI r2, 245
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
