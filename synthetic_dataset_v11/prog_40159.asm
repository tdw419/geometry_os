; DESCRIPTION: Places a white line segment connecting (234, 120) to (172, 155).
; PLAN: r0=234(x1), r1=120(y1), r2=172(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 120
LDI r2, 172
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
