; DESCRIPTION: Places a magenta line segment connecting (86, 71) to (193, 220).
; PLAN: r0=86(x1), r1=71(y1), r2=193(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 71
LDI r2, 193
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
