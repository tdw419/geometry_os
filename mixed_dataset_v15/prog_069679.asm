; DESCRIPTION: Draws a purple line from (357, 208) to (405, 228).
; PLAN: r0=357(x1), r1=208(y1), r2=405(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 208
LDI r2, 405
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
