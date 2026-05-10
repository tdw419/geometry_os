; DESCRIPTION: Draws a red line from (11, 14) to (370, 209).
; PLAN: r0=11(x1), r1=14(y1), r2=370(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 14
LDI r2, 370
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
