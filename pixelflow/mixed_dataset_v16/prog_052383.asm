; DESCRIPTION: Draws a red line from (280, 134) to (273, 23).
; PLAN: r0=280(x1), r1=134(y1), r2=273(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 134
LDI r2, 273
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
