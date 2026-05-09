; DESCRIPTION: Draws a red line from (175, 36) to (420, 149).
; PLAN: r0=175(x1), r1=36(y1), r2=420(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 36
LDI r2, 420
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
