; DESCRIPTION: Places a green line segment connecting (123, 247) to (23, 218).
; PLAN: r0=123(x1), r1=247(y1), r2=23(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 247
LDI r2, 23
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
