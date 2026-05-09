; DESCRIPTION: Draws a purple line from (61, 183) to (168, 212).
; PLAN: r0=61(x1), r1=183(y1), r2=168(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 183
LDI r2, 168
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
