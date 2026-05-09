; DESCRIPTION: Draws a red line from (178, 117) to (473, 155).
; PLAN: r0=178(x1), r1=117(y1), r2=473(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 117
LDI r2, 473
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
