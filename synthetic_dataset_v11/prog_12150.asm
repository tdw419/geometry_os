; DESCRIPTION: Draws a red line from (61, 130) to (212, 160).
; PLAN: r0=61(x1), r1=130(y1), r2=212(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 130
LDI r2, 212
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
