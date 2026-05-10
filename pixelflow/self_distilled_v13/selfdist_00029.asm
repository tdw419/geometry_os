; DESCRIPTION: Draws a purple line from (7, 16) to (43, 113).
; PLAN: r0=7(x1), r1=16(y1), r2=43(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 16
LDI r2, 43
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
