; DESCRIPTION: Places a white line segment connecting (211, 234) to (164, 165).
; PLAN: r0=211(x1), r1=234(y1), r2=164(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 234
LDI r2, 164
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
