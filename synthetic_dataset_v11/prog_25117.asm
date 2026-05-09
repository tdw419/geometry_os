; DESCRIPTION: Places a cyan line segment connecting (21, 22) to (123, 35).
; PLAN: r0=21(x1), r1=22(y1), r2=123(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 22
LDI r2, 123
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
