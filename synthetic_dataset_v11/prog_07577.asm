; DESCRIPTION: Places a magenta line segment connecting (181, 234) to (127, 99).
; PLAN: r0=181(x1), r1=234(y1), r2=127(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 234
LDI r2, 127
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
