; DESCRIPTION: Draws a red line from (101, 67) to (77, 40).
; PLAN: r0=101(x1), r1=67(y1), r2=77(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 67
LDI r2, 77
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
