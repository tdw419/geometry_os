; DESCRIPTION: Draws a green line from (182, 110) to (73, 3).
; PLAN: r0=182(x1), r1=110(y1), r2=73(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 110
LDI r2, 73
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
