; DESCRIPTION: Draws a white line from (31, 219) to (100, 195).
; PLAN: r0=31(x1), r1=219(y1), r2=100(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 219
LDI r2, 100
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
