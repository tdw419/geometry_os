; DESCRIPTION: Draws a red line from (290, 37) to (37, 140).
; PLAN: r0=290(x1), r1=37(y1), r2=37(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 37
LDI r2, 37
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
