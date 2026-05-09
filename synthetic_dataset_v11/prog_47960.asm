; DESCRIPTION: Draws a purple line from (196, 199) to (208, 253).
; PLAN: r0=196(x1), r1=199(y1), r2=208(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 199
LDI r2, 208
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
