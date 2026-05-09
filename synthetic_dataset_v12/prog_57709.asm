; DESCRIPTION: Draws a white line from (452, 6) to (315, 200).
; PLAN: r0=452(x1), r1=6(y1), r2=315(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 6
LDI r2, 315
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
