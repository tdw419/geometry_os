; DESCRIPTION: Places a red line segment connecting (44, 242) to (181, 16).
; PLAN: r0=44(x1), r1=242(y1), r2=181(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 242
LDI r2, 181
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
