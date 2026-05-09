; DESCRIPTION: Draws a purple line from (168, 182) to (137, 240).
; PLAN: r0=168(x1), r1=182(y1), r2=137(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 182
LDI r2, 137
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
