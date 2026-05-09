; DESCRIPTION: Places a magenta line segment connecting (222, 4) to (0, 55).
; PLAN: r0=222(x1), r1=4(y1), r2=0(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 4
LDI r2, 0
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
