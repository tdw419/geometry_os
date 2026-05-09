; DESCRIPTION: Places a magenta line segment connecting (234, 58) to (165, 29).
; PLAN: r0=234(x1), r1=58(y1), r2=165(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 58
LDI r2, 165
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
