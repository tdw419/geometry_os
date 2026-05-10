; DESCRIPTION: Places a green line segment connecting (495, 248) to (387, 238).
; PLAN: r0=495(x1), r1=248(y1), r2=387(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 248
LDI r2, 387
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
