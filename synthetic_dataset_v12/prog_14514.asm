; DESCRIPTION: Draws a orange line from (386, 182) to (214, 105).
; PLAN: r0=386(x1), r1=182(y1), r2=214(x2), r3=105(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 182
LDI r2, 214
LDI r3, 105
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
