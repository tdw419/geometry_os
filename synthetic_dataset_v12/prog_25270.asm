; DESCRIPTION: Places a green line segment connecting (113, 234) to (234, 72).
; PLAN: r0=113(x1), r1=234(y1), r2=234(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 234
LDI r2, 234
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
