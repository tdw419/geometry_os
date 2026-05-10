; DESCRIPTION: Draws a purple line from (27, 138) to (263, 84).
; PLAN: r0=27(x1), r1=138(y1), r2=263(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 138
LDI r2, 263
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
