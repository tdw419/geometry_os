; DESCRIPTION: Draws a white line from (3, 251) to (153, 5).
; PLAN: r0=3(x1), r1=251(y1), r2=153(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 251
LDI r2, 153
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
