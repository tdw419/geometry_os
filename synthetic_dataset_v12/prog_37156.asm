; DESCRIPTION: Draws a red line from (395, 28) to (341, 205).
; PLAN: r0=395(x1), r1=28(y1), r2=341(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 28
LDI r2, 341
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
