; DESCRIPTION: Draws a purple line from (450, 23) to (166, 48).
; PLAN: r0=450(x1), r1=23(y1), r2=166(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 23
LDI r2, 166
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
