; DESCRIPTION: Places a magenta line segment connecting (236, 236) to (234, 225).
; PLAN: r0=236(x1), r1=236(y1), r2=234(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 236
LDI r2, 234
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
