; DESCRIPTION: Draws a black line from (177, 166) to (34, 89).
; PLAN: r0=177(x1), r1=166(y1), r2=34(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 166
LDI r2, 34
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
