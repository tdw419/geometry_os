; DESCRIPTION: Places a cyan line segment connecting (115, 234) to (369, 67).
; PLAN: r0=115(x1), r1=234(y1), r2=369(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 234
LDI r2, 369
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
