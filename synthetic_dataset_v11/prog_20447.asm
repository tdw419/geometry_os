; DESCRIPTION: Places a green line segment connecting (127, 0) to (12, 46).
; PLAN: r0=127(x1), r1=0(y1), r2=12(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 0
LDI r2, 12
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
