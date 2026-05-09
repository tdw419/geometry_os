; DESCRIPTION: Places a purple line segment connecting (405, 127) to (391, 182).
; PLAN: r0=405(x1), r1=127(y1), r2=391(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 127
LDI r2, 391
LDI r3, 182
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
