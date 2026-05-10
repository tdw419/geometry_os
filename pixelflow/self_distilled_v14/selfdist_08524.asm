; DESCRIPTION: Draws a orange line from (356, 182) to (68, 55).
; PLAN: r0=356(x1), r1=182(y1), r2=68(x2), r3=55(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 182
LDI r2, 68
LDI r3, 55
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
