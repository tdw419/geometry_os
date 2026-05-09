; DESCRIPTION: Draws a purple line from (42, 248) to (54, 173).
; PLAN: r0=42(x1), r1=248(y1), r2=54(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 248
LDI r2, 54
LDI r3, 173
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
