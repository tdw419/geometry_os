; DESCRIPTION: Draws a red line from (203, 142) to (189, 138).
; PLAN: r0=203(x1), r1=142(y1), r2=189(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 142
LDI r2, 189
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
