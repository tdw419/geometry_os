; DESCRIPTION: Draws a white line from (459, 34) to (36, 19).
; PLAN: r0=459(x1), r1=34(y1), r2=36(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 34
LDI r2, 36
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
