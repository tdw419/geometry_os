; DESCRIPTION: Places a yellow line segment connecting (450, 23) to (305, 35).
; PLAN: r0=450(x1), r1=23(y1), r2=305(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 23
LDI r2, 305
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
