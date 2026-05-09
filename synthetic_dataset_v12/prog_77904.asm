; DESCRIPTION: Places a red line segment connecting (27, 32) to (468, 169).
; PLAN: r0=27(x1), r1=32(y1), r2=468(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 32
LDI r2, 468
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
