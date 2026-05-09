; DESCRIPTION: Draws a blue line from (42, 183) to (131, 148).
; PLAN: r0=42(x1), r1=183(y1), r2=131(x2), r3=148(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 183
LDI r2, 131
LDI r3, 148
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
