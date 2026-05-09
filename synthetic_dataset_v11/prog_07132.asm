; DESCRIPTION: Places a red line segment connecting (59, 212) to (193, 182).
; PLAN: r0=59(x1), r1=212(y1), r2=193(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 212
LDI r2, 193
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
