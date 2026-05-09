; DESCRIPTION: Renders a orange line between points (368, 179) and (307, 71).
; PLAN: r0=368(x1), r1=179(y1), r2=307(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 179
LDI r2, 307
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
