; DESCRIPTION: Draws a yellow line from (395, 47) to (4, 131).
; PLAN: r0=395(x1), r1=47(y1), r2=4(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 47
LDI r2, 4
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
