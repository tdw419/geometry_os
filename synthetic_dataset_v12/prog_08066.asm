; DESCRIPTION: Draws a red line from (356, 174) to (53, 71).
; PLAN: r0=356(x1), r1=174(y1), r2=53(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 174
LDI r2, 53
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
