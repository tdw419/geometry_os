; DESCRIPTION: Draws a red line from (477, 220) to (368, 17).
; PLAN: r0=477(x1), r1=220(y1), r2=368(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 220
LDI r2, 368
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
