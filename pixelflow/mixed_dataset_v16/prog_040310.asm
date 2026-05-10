; DESCRIPTION: Draws a purple line from (237, 25) to (434, 15).
; PLAN: r0=237(x1), r1=25(y1), r2=434(x2), r3=15(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 25
LDI r2, 434
LDI r3, 15
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
