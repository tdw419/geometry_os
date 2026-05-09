; DESCRIPTION: Places a magenta line segment connecting (193, 243) to (236, 73).
; PLAN: r0=193(x1), r1=243(y1), r2=236(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 243
LDI r2, 236
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
