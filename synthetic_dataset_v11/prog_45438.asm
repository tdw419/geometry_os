; DESCRIPTION: Places a red line segment connecting (123, 125) to (38, 44).
; PLAN: r0=123(x1), r1=125(y1), r2=38(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 125
LDI r2, 38
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
