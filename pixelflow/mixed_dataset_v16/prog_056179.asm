; DESCRIPTION: Draws a green line from (153, 110) to (1, 114).
; PLAN: r0=153(x1), r1=110(y1), r2=1(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 110
LDI r2, 1
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
