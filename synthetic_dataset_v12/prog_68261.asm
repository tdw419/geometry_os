; DESCRIPTION: Places a magenta line segment connecting (421, 197) to (232, 106).
; PLAN: r0=421(x1), r1=197(y1), r2=232(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 197
LDI r2, 232
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
