; DESCRIPTION: Places a white line segment connecting (1, 234) to (28, 189).
; PLAN: r0=1(x1), r1=234(y1), r2=28(x2), r3=189(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 234
LDI r2, 28
LDI r3, 189
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
