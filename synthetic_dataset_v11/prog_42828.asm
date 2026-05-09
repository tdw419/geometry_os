; DESCRIPTION: Draws a black line from (57, 139) to (90, 92).
; PLAN: r0=57(x1), r1=139(y1), r2=90(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 139
LDI r2, 90
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
