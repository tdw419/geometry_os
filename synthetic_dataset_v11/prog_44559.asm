; DESCRIPTION: Draws a red line from (71, 205) to (81, 230).
; PLAN: r0=71(x1), r1=205(y1), r2=81(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 205
LDI r2, 81
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
