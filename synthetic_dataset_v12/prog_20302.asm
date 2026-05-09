; DESCRIPTION: Draws a purple line from (9, 172) to (193, 210).
; PLAN: r0=9(x1), r1=172(y1), r2=193(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 172
LDI r2, 193
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
