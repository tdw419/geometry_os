; DESCRIPTION: Draws a red line from (61, 130) to (133, 26).
; PLAN: r0=61(x1), r1=130(y1), r2=133(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 130
LDI r2, 133
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
