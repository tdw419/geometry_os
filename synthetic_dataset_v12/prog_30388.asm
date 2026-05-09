; DESCRIPTION: Places a cyan line segment connecting (129, 244) to (369, 76).
; PLAN: r0=129(x1), r1=244(y1), r2=369(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 244
LDI r2, 369
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
