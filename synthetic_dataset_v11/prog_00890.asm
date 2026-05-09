; DESCRIPTION: Places a red line segment connecting (206, 91) to (77, 96).
; PLAN: r0=206(x1), r1=91(y1), r2=77(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 91
LDI r2, 77
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
