; DESCRIPTION: Draws a purple line from (107, 183) to (196, 172).
; PLAN: r0=107(x1), r1=183(y1), r2=196(x2), r3=172(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 183
LDI r2, 196
LDI r3, 172
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
