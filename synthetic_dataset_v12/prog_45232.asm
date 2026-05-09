; DESCRIPTION: Places a cyan line segment connecting (123, 183) to (222, 97).
; PLAN: r0=123(x1), r1=183(y1), r2=222(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 183
LDI r2, 222
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
