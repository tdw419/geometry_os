; DESCRIPTION: Draws a yellow line from (507, 182) to (36, 82).
; PLAN: r0=507(x1), r1=182(y1), r2=36(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 182
LDI r2, 36
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
