; DESCRIPTION: Draws a purple line from (42, 4) to (420, 129).
; PLAN: r0=42(x1), r1=4(y1), r2=420(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 4
LDI r2, 420
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
