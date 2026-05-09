; DESCRIPTION: Places a magenta line segment connecting (196, 195) to (212, 73).
; PLAN: r0=196(x1), r1=195(y1), r2=212(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 195
LDI r2, 212
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
