; DESCRIPTION: Draws a purple line from (202, 254) to (59, 11).
; PLAN: r0=202(x1), r1=254(y1), r2=59(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 254
LDI r2, 59
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
