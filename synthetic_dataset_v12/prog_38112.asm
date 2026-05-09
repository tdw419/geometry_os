; DESCRIPTION: Places a magenta line segment connecting (121, 79) to (307, 54).
; PLAN: r0=121(x1), r1=79(y1), r2=307(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 79
LDI r2, 307
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
