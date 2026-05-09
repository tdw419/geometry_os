; DESCRIPTION: Draws a black line from (471, 210) to (414, 175).
; PLAN: r0=471(x1), r1=210(y1), r2=414(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 210
LDI r2, 414
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
