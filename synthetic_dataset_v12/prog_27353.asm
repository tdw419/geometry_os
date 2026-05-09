; DESCRIPTION: Draws a purple line from (401, 243) to (288, 175).
; PLAN: r0=401(x1), r1=243(y1), r2=288(x2), r3=175(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 243
LDI r2, 288
LDI r3, 175
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
