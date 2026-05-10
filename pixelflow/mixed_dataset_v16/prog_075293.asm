; DESCRIPTION: Draws a green line from (115, 58) to (339, 129).
; PLAN: r0=115(x1), r1=58(y1), r2=339(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 58
LDI r2, 339
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
