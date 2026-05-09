; DESCRIPTION: Draws a white line from (252, 219) to (5, 9).
; PLAN: r0=252(x1), r1=219(y1), r2=5(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 219
LDI r2, 5
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
