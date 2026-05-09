; DESCRIPTION: Places a magenta line segment connecting (410, 82) to (208, 238).
; PLAN: r0=410(x1), r1=82(y1), r2=208(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 82
LDI r2, 208
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
