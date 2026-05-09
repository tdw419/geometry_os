; DESCRIPTION: Places a cyan line segment connecting (188, 214) to (89, 72).
; PLAN: r0=188(x1), r1=214(y1), r2=89(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 214
LDI r2, 89
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
