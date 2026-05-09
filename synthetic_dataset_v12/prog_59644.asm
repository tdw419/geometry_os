; DESCRIPTION: Draws a white line from (200, 160) to (330, 115).
; PLAN: r0=200(x1), r1=160(y1), r2=330(x2), r3=115(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 160
LDI r2, 330
LDI r3, 115
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
