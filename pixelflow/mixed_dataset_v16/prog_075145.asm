; DESCRIPTION: Renders a magenta line between points (456, 179) and (380, 132).
; PLAN: r0=456(x1), r1=179(y1), r2=380(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 179
LDI r2, 380
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
