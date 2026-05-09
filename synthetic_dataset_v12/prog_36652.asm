; DESCRIPTION: Places a white line segment connecting (414, 84) to (27, 141).
; PLAN: r0=414(x1), r1=84(y1), r2=27(x2), r3=141(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 84
LDI r2, 27
LDI r3, 141
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
