; DESCRIPTION: Draws a purple line from (249, 205) to (217, 43).
; PLAN: r0=249(x1), r1=205(y1), r2=217(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 205
LDI r2, 217
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
