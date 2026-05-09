; DESCRIPTION: Draws a red line from (71, 154) to (52, 80).
; PLAN: r0=71(x1), r1=154(y1), r2=52(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 154
LDI r2, 52
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
