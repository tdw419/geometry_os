; DESCRIPTION: Draws a red line from (58, 225) to (222, 46).
; PLAN: r0=58(x1), r1=225(y1), r2=222(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 225
LDI r2, 222
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
