; DESCRIPTION: Draws a orange line from (368, 71) to (386, 194).
; PLAN: r0=368(x1), r1=71(y1), r2=386(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 71
LDI r2, 386
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
