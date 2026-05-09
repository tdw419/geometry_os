; DESCRIPTION: Draws a purple line from (42, 63) to (192, 94).
; PLAN: r0=42(x1), r1=63(y1), r2=192(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 63
LDI r2, 192
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
