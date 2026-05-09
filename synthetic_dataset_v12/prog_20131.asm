; DESCRIPTION: Places a cyan line segment connecting (201, 160) to (470, 161).
; PLAN: r0=201(x1), r1=160(y1), r2=470(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 160
LDI r2, 470
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
