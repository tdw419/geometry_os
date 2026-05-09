; DESCRIPTION: Draws a purple line from (115, 199) to (67, 42).
; PLAN: r0=115(x1), r1=199(y1), r2=67(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 199
LDI r2, 67
LDI r3, 42
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
