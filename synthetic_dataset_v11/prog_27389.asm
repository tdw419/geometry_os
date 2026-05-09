; DESCRIPTION: Places a cyan line segment connecting (101, 193) to (162, 188).
; PLAN: r0=101(x1), r1=193(y1), r2=162(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 193
LDI r2, 162
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
