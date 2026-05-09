; DESCRIPTION: Places a magenta line segment connecting (160, 195) to (127, 229).
; PLAN: r0=160(x1), r1=195(y1), r2=127(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 195
LDI r2, 127
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
