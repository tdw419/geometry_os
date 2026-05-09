; DESCRIPTION: Draws a red line from (80, 242) to (71, 118).
; PLAN: r0=80(x1), r1=242(y1), r2=71(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 242
LDI r2, 71
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
