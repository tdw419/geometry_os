; DESCRIPTION: Draws a green line from (225, 40) to (35, 112).
; PLAN: r0=225(x1), r1=40(y1), r2=35(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 40
LDI r2, 35
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
