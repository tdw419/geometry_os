; DESCRIPTION: Draws a white line from (205, 162) to (194, 254).
; PLAN: r0=205(x1), r1=162(y1), r2=194(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 162
LDI r2, 194
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
