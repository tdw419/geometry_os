; DESCRIPTION: Places a green line segment connecting (4, 171) to (85, 71).
; PLAN: r0=4(x1), r1=171(y1), r2=85(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 171
LDI r2, 85
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
