; DESCRIPTION: Places a green line segment connecting (80, 124) to (218, 45).
; PLAN: r0=80(x1), r1=124(y1), r2=218(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 124
LDI r2, 218
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
