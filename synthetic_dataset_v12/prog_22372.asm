; DESCRIPTION: Draws a red line from (444, 103) to (482, 77).
; PLAN: r0=444(x1), r1=103(y1), r2=482(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 103
LDI r2, 482
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
