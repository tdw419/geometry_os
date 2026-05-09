; DESCRIPTION: Draws a white line from (251, 69) to (83, 121).
; PLAN: r0=251(x1), r1=69(y1), r2=83(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 69
LDI r2, 83
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
