; DESCRIPTION: Places a magenta line segment connecting (238, 134) to (231, 193).
; PLAN: r0=238(x1), r1=134(y1), r2=231(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 134
LDI r2, 231
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
