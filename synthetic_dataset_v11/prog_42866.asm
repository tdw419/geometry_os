; DESCRIPTION: Places a green line segment connecting (181, 189) to (146, 102).
; PLAN: r0=181(x1), r1=189(y1), r2=146(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 189
LDI r2, 146
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
