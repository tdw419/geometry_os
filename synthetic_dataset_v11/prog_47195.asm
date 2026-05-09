; DESCRIPTION: Draws a purple line from (236, 239) to (144, 143).
; PLAN: r0=236(x1), r1=239(y1), r2=144(x2), r3=143(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 239
LDI r2, 144
LDI r3, 143
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
