; DESCRIPTION: Draws a green line from (88, 207) to (131, 46).
; PLAN: r0=88(x1), r1=207(y1), r2=131(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 207
LDI r2, 131
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
