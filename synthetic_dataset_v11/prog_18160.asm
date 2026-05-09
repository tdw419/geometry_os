; DESCRIPTION: Draws a red line from (142, 223) to (247, 54).
; PLAN: r0=142(x1), r1=223(y1), r2=247(x2), r3=54(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 223
LDI r2, 247
LDI r3, 54
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
