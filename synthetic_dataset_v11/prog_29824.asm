; DESCRIPTION: Places a green line segment connecting (200, 124) to (64, 168).
; PLAN: r0=200(x1), r1=124(y1), r2=64(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 124
LDI r2, 64
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
