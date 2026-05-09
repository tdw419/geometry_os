; DESCRIPTION: Draws a white line from (260, 17) to (77, 53).
; PLAN: r0=260(x1), r1=17(y1), r2=77(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 17
LDI r2, 77
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
