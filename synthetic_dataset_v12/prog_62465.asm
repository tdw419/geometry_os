; DESCRIPTION: Places a red line segment connecting (250, 59) to (96, 16).
; PLAN: r0=250(x1), r1=59(y1), r2=96(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 59
LDI r2, 96
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
