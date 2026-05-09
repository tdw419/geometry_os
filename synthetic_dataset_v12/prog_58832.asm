; DESCRIPTION: Draws a black line from (124, 139) to (273, 61).
; PLAN: r0=124(x1), r1=139(y1), r2=273(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 139
LDI r2, 273
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
