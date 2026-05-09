; DESCRIPTION: Renders a magenta line between points (85, 139) and (39, 127).
; PLAN: r0=85(x1), r1=139(y1), r2=39(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 139
LDI r2, 39
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
