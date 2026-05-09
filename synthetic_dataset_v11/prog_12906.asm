; DESCRIPTION: Places a yellow line segment connecting (57, 182) to (28, 182).
; PLAN: r0=57(x1), r1=182(y1), r2=28(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 182
LDI r2, 28
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
