; DESCRIPTION: Draws a purple line from (405, 75) to (429, 152).
; PLAN: r0=405(x1), r1=75(y1), r2=429(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 75
LDI r2, 429
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
