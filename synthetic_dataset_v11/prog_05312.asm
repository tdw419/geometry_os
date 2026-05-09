; DESCRIPTION: Draws a green line from (141, 54) to (58, 35).
; PLAN: r0=141(x1), r1=54(y1), r2=58(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 54
LDI r2, 58
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
