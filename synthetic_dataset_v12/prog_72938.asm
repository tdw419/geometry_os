; DESCRIPTION: Draws a yellow line from (140, 207) to (475, 36).
; PLAN: r0=140(x1), r1=207(y1), r2=475(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 207
LDI r2, 475
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
