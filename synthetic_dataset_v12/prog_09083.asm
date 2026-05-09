; DESCRIPTION: Places a red line segment connecting (106, 238) to (29, 71).
; PLAN: r0=106(x1), r1=238(y1), r2=29(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 238
LDI r2, 29
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
