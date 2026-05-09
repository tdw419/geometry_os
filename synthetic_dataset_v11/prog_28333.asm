; DESCRIPTION: Draws a purple line from (237, 249) to (234, 144).
; PLAN: r0=237(x1), r1=249(y1), r2=234(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 249
LDI r2, 234
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
