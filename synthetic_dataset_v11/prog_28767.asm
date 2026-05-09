; DESCRIPTION: Draws a purple line from (42, 183) to (39, 109).
; PLAN: r0=42(x1), r1=183(y1), r2=39(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 183
LDI r2, 39
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
