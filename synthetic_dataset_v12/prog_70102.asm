; DESCRIPTION: Draws a purple line from (252, 46) to (455, 173).
; PLAN: r0=252(x1), r1=46(y1), r2=455(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 46
LDI r2, 455
LDI r3, 173
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
