; DESCRIPTION: Draws a purple line from (176, 99) to (320, 214).
; PLAN: r0=176(x1), r1=99(y1), r2=320(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 99
LDI r2, 320
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
