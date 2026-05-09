; DESCRIPTION: Draws a white line from (174, 8) to (423, 200).
; PLAN: r0=174(x1), r1=8(y1), r2=423(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 8
LDI r2, 423
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
