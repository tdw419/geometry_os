; DESCRIPTION: Draws a orange line from (127, 182) to (45, 208).
; PLAN: r0=127(x1), r1=182(y1), r2=45(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 182
LDI r2, 45
LDI r3, 208
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
