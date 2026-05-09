; DESCRIPTION: Draws a purple line from (125, 209) to (63, 14).
; PLAN: r0=125(x1), r1=209(y1), r2=63(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 209
LDI r2, 63
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
