; DESCRIPTION: Draws a green line from (58, 121) to (207, 77).
; PLAN: r0=58(x1), r1=121(y1), r2=207(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 121
LDI r2, 207
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
