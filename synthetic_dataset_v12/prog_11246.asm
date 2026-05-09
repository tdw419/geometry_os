; DESCRIPTION: Draws a red line from (341, 230) to (108, 148).
; PLAN: r0=341(x1), r1=230(y1), r2=108(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 230
LDI r2, 108
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
