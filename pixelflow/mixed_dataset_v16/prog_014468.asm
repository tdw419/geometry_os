; DESCRIPTION: Draws a purple line from (241, 128) to (492, 113).
; PLAN: r0=241(x1), r1=128(y1), r2=492(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 128
LDI r2, 492
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
