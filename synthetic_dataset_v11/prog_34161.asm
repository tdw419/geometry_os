; DESCRIPTION: Draws a black line from (115, 34) to (21, 34).
; PLAN: r0=115(x1), r1=34(y1), r2=21(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 34
LDI r2, 21
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
