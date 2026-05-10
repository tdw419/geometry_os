; DESCRIPTION: Places a white line segment connecting (155, 113) to (46, 233).
; PLAN: r0=155(x1), r1=113(y1), r2=46(x2), r3=233(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 113
LDI r2, 46
LDI r3, 233
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
