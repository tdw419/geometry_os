; DESCRIPTION: Draws a purple line from (245, 205) to (246, 68).
; PLAN: r0=245(x1), r1=205(y1), r2=246(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 205
LDI r2, 246
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
