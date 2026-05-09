; DESCRIPTION: Draws a white line from (241, 211) to (22, 83).
; PLAN: r0=241(x1), r1=211(y1), r2=22(x2), r3=83(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 211
LDI r2, 22
LDI r3, 83
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
