; DESCRIPTION: Draws a red line from (225, 195) to (312, 69).
; PLAN: r0=225(x1), r1=195(y1), r2=312(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 195
LDI r2, 312
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
