; DESCRIPTION: Draws a purple line from (173, 3) to (63, 210).
; PLAN: r0=173(x1), r1=3(y1), r2=63(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 3
LDI r2, 63
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
