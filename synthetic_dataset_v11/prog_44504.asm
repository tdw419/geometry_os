; DESCRIPTION: Draws a yellow line from (216, 239) to (128, 97).
; PLAN: r0=216(x1), r1=239(y1), r2=128(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 239
LDI r2, 128
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
