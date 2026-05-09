; DESCRIPTION: Draws a purple line from (140, 36) to (27, 27).
; PLAN: r0=140(x1), r1=36(y1), r2=27(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 36
LDI r2, 27
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
