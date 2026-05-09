; DESCRIPTION: Places a magenta line segment connecting (45, 73) to (85, 146).
; PLAN: r0=45(x1), r1=73(y1), r2=85(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 73
LDI r2, 85
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
