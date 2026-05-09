; DESCRIPTION: Draws a green line from (85, 182) to (193, 181).
; PLAN: r0=85(x1), r1=182(y1), r2=193(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 182
LDI r2, 193
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
