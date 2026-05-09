; DESCRIPTION: Draws a red line from (104, 74) to (322, 99).
; PLAN: r0=104(x1), r1=74(y1), r2=322(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 74
LDI r2, 322
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
