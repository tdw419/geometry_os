; DESCRIPTION: Places a cyan line segment connecting (22, 225) to (10, 250).
; PLAN: r0=22(x1), r1=225(y1), r2=10(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 225
LDI r2, 10
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
