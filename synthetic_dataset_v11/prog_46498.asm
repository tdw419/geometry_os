; DESCRIPTION: Places a green line segment connecting (193, 143) to (85, 187).
; PLAN: r0=193(x1), r1=143(y1), r2=85(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 143
LDI r2, 85
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
