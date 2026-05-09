; DESCRIPTION: Places a red line segment connecting (328, 192) to (23, 13).
; PLAN: r0=328(x1), r1=192(y1), r2=23(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 192
LDI r2, 23
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
