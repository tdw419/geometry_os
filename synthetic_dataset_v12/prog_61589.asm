; DESCRIPTION: Draws a purple line from (40, 82) to (271, 192).
; PLAN: r0=40(x1), r1=82(y1), r2=271(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 82
LDI r2, 271
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
