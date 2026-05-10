; DESCRIPTION: Draws a purple line from (387, 37) to (40, 59).
; PLAN: r0=387(x1), r1=37(y1), r2=40(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 37
LDI r2, 40
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
