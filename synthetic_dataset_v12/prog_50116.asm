; DESCRIPTION: Places a purple line segment connecting (146, 68) to (361, 134).
; PLAN: r0=146(x1), r1=68(y1), r2=361(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 68
LDI r2, 361
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
