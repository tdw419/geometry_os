; DESCRIPTION: Draws a purple line from (88, 230) to (272, 113).
; PLAN: r0=88(x1), r1=230(y1), r2=272(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 230
LDI r2, 272
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
