; DESCRIPTION: Places a green line segment connecting (407, 113) to (357, 117).
; PLAN: r0=407(x1), r1=113(y1), r2=357(x2), r3=117(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 113
LDI r2, 357
LDI r3, 117
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
