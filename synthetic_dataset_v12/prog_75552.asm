; DESCRIPTION: Places a green line segment connecting (116, 234) to (500, 109).
; PLAN: r0=116(x1), r1=234(y1), r2=500(x2), r3=109(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 234
LDI r2, 500
LDI r3, 109
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
