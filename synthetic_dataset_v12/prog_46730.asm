; DESCRIPTION: Places a green line segment connecting (429, 100) to (81, 171).
; PLAN: r0=429(x1), r1=100(y1), r2=81(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 100
LDI r2, 81
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
