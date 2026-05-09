; DESCRIPTION: Places a cyan line segment connecting (328, 80) to (123, 200).
; PLAN: r0=328(x1), r1=80(y1), r2=123(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 80
LDI r2, 123
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
