; DESCRIPTION: Places a magenta line segment connecting (94, 93) to (247, 143).
; PLAN: r0=94(x1), r1=93(y1), r2=247(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 93
LDI r2, 247
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
