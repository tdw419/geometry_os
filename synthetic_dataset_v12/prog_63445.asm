; DESCRIPTION: Draws a purple line from (362, 116) to (102, 208).
; PLAN: r0=362(x1), r1=116(y1), r2=102(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 116
LDI r2, 102
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
