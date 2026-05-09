; DESCRIPTION: Draws a white line from (129, 177) to (52, 115).
; PLAN: r0=129(x1), r1=177(y1), r2=52(x2), r3=115(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 177
LDI r2, 52
LDI r3, 115
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
