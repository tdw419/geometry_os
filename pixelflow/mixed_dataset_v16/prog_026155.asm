; DESCRIPTION: Draws a purple line from (442, 117) to (434, 175).
; PLAN: r0=442(x1), r1=117(y1), r2=434(x2), r3=175(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 117
LDI r2, 434
LDI r3, 175
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
