; DESCRIPTION: Draws a purple line from (407, 184) to (269, 42).
; PLAN: r0=407(x1), r1=184(y1), r2=269(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 184
LDI r2, 269
LDI r3, 42
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
