; DESCRIPTION: Draws a white line from (25, 211) to (219, 22).
; PLAN: r0=25(x1), r1=211(y1), r2=219(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 211
LDI r2, 219
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
