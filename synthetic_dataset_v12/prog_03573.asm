; DESCRIPTION: Draws a purple line from (165, 210) to (345, 5).
; PLAN: r0=165(x1), r1=210(y1), r2=345(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 210
LDI r2, 345
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
