; DESCRIPTION: Draws a black line from (40, 28) to (218, 106).
; PLAN: r0=40(x1), r1=28(y1), r2=218(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 28
LDI r2, 218
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
