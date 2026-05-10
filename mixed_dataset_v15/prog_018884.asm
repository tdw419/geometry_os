; DESCRIPTION: Draws a yellow line from (303, 23) to (342, 112).
; PLAN: r0=303(x1), r1=23(y1), r2=342(x2), r3=112(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 23
LDI r2, 342
LDI r3, 112
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
