; DESCRIPTION: Places a white line segment connecting (103, 185) to (182, 137).
; PLAN: r0=103(x1), r1=185(y1), r2=182(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 185
LDI r2, 182
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
