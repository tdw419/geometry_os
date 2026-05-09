; DESCRIPTION: Places a white line segment connecting (97, 204) to (120, 182).
; PLAN: r0=97(x1), r1=204(y1), r2=120(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 204
LDI r2, 120
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
