; DESCRIPTION: Places a green line segment connecting (174, 72) to (193, 157).
; PLAN: r0=174(x1), r1=72(y1), r2=193(x2), r3=157(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 72
LDI r2, 193
LDI r3, 157
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
