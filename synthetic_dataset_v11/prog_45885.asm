; DESCRIPTION: Draws a yellow line from (237, 182) to (95, 3).
; PLAN: r0=237(x1), r1=182(y1), r2=95(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 182
LDI r2, 95
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
