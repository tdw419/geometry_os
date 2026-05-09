; DESCRIPTION: Draws a red line from (33, 44) to (203, 129).
; PLAN: r0=33(x1), r1=44(y1), r2=203(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 44
LDI r2, 203
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
