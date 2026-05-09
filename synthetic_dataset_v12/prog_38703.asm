; DESCRIPTION: Draws a purple line from (320, 166) to (262, 123).
; PLAN: r0=320(x1), r1=166(y1), r2=262(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 166
LDI r2, 262
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
