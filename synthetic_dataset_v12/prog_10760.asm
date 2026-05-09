; DESCRIPTION: Places a red line segment connecting (81, 9) to (263, 59).
; PLAN: r0=81(x1), r1=9(y1), r2=263(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 9
LDI r2, 263
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
