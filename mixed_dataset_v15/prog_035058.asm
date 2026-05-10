; DESCRIPTION: Draws a red line from (288, 53) to (73, 12).
; PLAN: r0=288(x1), r1=53(y1), r2=73(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 53
LDI r2, 73
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
