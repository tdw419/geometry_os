; DESCRIPTION: Places a red line segment connecting (250, 193) to (164, 98).
; PLAN: r0=250(x1), r1=193(y1), r2=164(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 193
LDI r2, 164
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
