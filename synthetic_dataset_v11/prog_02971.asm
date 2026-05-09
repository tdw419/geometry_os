; DESCRIPTION: Draws a white line from (200, 56) to (9, 60).
; PLAN: r0=200(x1), r1=56(y1), r2=9(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 56
LDI r2, 9
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
