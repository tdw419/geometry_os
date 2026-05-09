; DESCRIPTION: Places a blue line segment connecting (380, 156) to (345, 193).
; PLAN: r0=380(x1), r1=156(y1), r2=345(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 156
LDI r2, 345
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
