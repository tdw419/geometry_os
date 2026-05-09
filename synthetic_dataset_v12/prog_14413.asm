; DESCRIPTION: Draws a purple line from (57, 149) to (23, 75).
; PLAN: r0=57(x1), r1=149(y1), r2=23(x2), r3=75(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 149
LDI r2, 23
LDI r3, 75
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
