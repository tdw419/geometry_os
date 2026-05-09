; DESCRIPTION: Draws a black line from (73, 54) to (306, 109).
; PLAN: r0=73(x1), r1=54(y1), r2=306(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 54
LDI r2, 306
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
