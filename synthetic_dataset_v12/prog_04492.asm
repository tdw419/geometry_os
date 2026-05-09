; DESCRIPTION: Places a magenta line segment connecting (125, 151) to (234, 183).
; PLAN: r0=125(x1), r1=151(y1), r2=234(x2), r3=183(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 151
LDI r2, 234
LDI r3, 183
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
