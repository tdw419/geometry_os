; DESCRIPTION: Places a yellow line segment connecting (311, 65) to (269, 46).
; PLAN: r0=311(x1), r1=65(y1), r2=269(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 65
LDI r2, 269
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
