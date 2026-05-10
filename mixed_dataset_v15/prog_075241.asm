; DESCRIPTION: Renders a magenta line between points (179, 162) and (116, 96).
; PLAN: r0=179(x1), r1=162(y1), r2=116(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 162
LDI r2, 116
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
