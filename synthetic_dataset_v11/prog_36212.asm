; DESCRIPTION: Places a red line segment connecting (186, 81) to (210, 101).
; PLAN: r0=186(x1), r1=81(y1), r2=210(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 81
LDI r2, 210
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
