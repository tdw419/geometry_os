; DESCRIPTION: Places a red line segment connecting (10, 238) to (96, 29).
; PLAN: r0=10(x1), r1=238(y1), r2=96(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 238
LDI r2, 96
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
