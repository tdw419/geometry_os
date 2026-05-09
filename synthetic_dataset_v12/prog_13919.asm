; DESCRIPTION: Places a red line segment connecting (431, 103) to (193, 121).
; PLAN: r0=431(x1), r1=103(y1), r2=193(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 103
LDI r2, 193
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
