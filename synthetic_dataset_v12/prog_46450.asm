; DESCRIPTION: Draws a red line from (342, 143) to (313, 69).
; PLAN: r0=342(x1), r1=143(y1), r2=313(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 143
LDI r2, 313
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
