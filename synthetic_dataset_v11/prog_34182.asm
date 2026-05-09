; DESCRIPTION: Draws a purple line from (126, 241) to (127, 229).
; PLAN: r0=126(x1), r1=241(y1), r2=127(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 241
LDI r2, 127
LDI r3, 229
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
