; DESCRIPTION: Draws a red line from (469, 116) to (501, 146).
; PLAN: r0=469(x1), r1=116(y1), r2=501(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 116
LDI r2, 501
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
