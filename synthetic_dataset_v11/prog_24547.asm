; DESCRIPTION: Places a yellow line segment connecting (182, 212) to (9, 108).
; PLAN: r0=182(x1), r1=212(y1), r2=9(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 212
LDI r2, 9
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
