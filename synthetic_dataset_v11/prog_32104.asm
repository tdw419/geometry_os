; DESCRIPTION: Draws a red line from (185, 12) to (230, 108).
; PLAN: r0=185(x1), r1=12(y1), r2=230(x2), r3=108(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 12
LDI r2, 230
LDI r3, 108
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
