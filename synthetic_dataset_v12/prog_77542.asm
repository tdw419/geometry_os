; DESCRIPTION: Draws a purple line from (319, 186) to (383, 182).
; PLAN: r0=319(x1), r1=186(y1), r2=383(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 186
LDI r2, 383
LDI r3, 182
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
