; DESCRIPTION: Places a red line segment connecting (136, 194) to (236, 59).
; PLAN: r0=136(x1), r1=194(y1), r2=236(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 194
LDI r2, 236
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
