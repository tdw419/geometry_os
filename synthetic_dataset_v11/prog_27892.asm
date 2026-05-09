; DESCRIPTION: Places a white line segment connecting (181, 193) to (177, 98).
; PLAN: r0=181(x1), r1=193(y1), r2=177(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 193
LDI r2, 177
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
