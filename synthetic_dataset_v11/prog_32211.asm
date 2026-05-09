; DESCRIPTION: Places a red line segment connecting (16, 142) to (177, 59).
; PLAN: r0=16(x1), r1=142(y1), r2=177(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 142
LDI r2, 177
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
