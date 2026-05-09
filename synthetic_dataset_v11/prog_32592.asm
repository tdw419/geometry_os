; DESCRIPTION: Draws a black line from (99, 167) to (34, 36).
; PLAN: r0=99(x1), r1=167(y1), r2=34(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 167
LDI r2, 34
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
