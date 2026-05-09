; DESCRIPTION: Draws a red line from (67, 170) to (212, 48).
; PLAN: r0=67(x1), r1=170(y1), r2=212(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 170
LDI r2, 212
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
