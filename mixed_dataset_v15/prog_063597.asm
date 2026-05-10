; DESCRIPTION: Draws a purple line from (45, 40) to (183, 210).
; PLAN: r0=45(x1), r1=40(y1), r2=183(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 40
LDI r2, 183
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
