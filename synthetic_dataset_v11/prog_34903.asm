; DESCRIPTION: Draws a purple line from (92, 63) to (196, 138).
; PLAN: r0=92(x1), r1=63(y1), r2=196(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 63
LDI r2, 196
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
