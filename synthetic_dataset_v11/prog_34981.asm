; DESCRIPTION: Places a red line segment connecting (250, 39) to (38, 225).
; PLAN: r0=250(x1), r1=39(y1), r2=38(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 39
LDI r2, 38
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
