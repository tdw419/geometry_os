; DESCRIPTION: Places a yellow line segment connecting (439, 47) to (187, 8).
; PLAN: r0=439(x1), r1=47(y1), r2=187(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 47
LDI r2, 187
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
