; DESCRIPTION: Draws a purple line from (27, 21) to (429, 231).
; PLAN: r0=27(x1), r1=21(y1), r2=429(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 21
LDI r2, 429
LDI r3, 231
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
