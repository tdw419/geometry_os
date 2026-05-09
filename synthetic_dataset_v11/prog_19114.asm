; DESCRIPTION: Places a black line segment connecting (23, 182) to (117, 52).
; PLAN: r0=23(x1), r1=182(y1), r2=117(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 182
LDI r2, 117
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
