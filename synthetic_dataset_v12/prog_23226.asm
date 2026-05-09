; DESCRIPTION: Places a magenta line segment connecting (375, 250) to (511, 33).
; PLAN: r0=375(x1), r1=250(y1), r2=511(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 250
LDI r2, 511
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
