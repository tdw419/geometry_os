; DESCRIPTION: Places a cyan line segment connecting (110, 58) to (1, 196).
; PLAN: r0=110(x1), r1=58(y1), r2=1(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 58
LDI r2, 1
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
