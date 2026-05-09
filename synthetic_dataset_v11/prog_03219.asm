; DESCRIPTION: Places a cyan line segment connecting (189, 231) to (132, 109).
; PLAN: r0=189(x1), r1=231(y1), r2=132(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 231
LDI r2, 132
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
