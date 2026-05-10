; DESCRIPTION: Places a yellow line segment connecting (218, 182) to (205, 160).
; PLAN: r0=218(x1), r1=182(y1), r2=205(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 182
LDI r2, 205
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
