; DESCRIPTION: Draws a blue line from (75, 182) to (24, 109).
; PLAN: r0=75(x1), r1=182(y1), r2=24(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 182
LDI r2, 24
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
