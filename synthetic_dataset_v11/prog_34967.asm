; DESCRIPTION: Draws a black line from (168, 182) to (133, 75).
; PLAN: r0=168(x1), r1=182(y1), r2=133(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 182
LDI r2, 133
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
