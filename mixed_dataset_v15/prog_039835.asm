; DESCRIPTION: Draws a red line from (382, 110) to (118, 210).
; PLAN: r0=382(x1), r1=110(y1), r2=118(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 110
LDI r2, 118
LDI r3, 210
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
