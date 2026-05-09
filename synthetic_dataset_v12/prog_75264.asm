; DESCRIPTION: Places a green line segment connecting (8, 46) to (212, 108).
; PLAN: r0=8(x1), r1=46(y1), r2=212(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 46
LDI r2, 212
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
