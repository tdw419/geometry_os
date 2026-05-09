; DESCRIPTION: Draws a purple line from (313, 254) to (337, 113).
; PLAN: r0=313(x1), r1=254(y1), r2=337(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 254
LDI r2, 337
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
