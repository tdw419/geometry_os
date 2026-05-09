; DESCRIPTION: Draws a purple line from (153, 61) to (42, 61).
; PLAN: r0=153(x1), r1=61(y1), r2=42(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 61
LDI r2, 42
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
