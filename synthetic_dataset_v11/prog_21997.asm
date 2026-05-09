; DESCRIPTION: Places a white line segment connecting (140, 98) to (193, 137).
; PLAN: r0=140(x1), r1=98(y1), r2=193(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 98
LDI r2, 193
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
