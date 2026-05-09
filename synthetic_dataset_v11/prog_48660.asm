; DESCRIPTION: Draws a magenta line from (154, 60) to (93, 165).
; PLAN: r0=154(x1), r1=60(y1), r2=93(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 60
LDI r2, 93
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
