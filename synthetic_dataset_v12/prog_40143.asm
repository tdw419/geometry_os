; DESCRIPTION: Draws a purple line from (465, 210) to (46, 65).
; PLAN: r0=465(x1), r1=210(y1), r2=46(x2), r3=65(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 210
LDI r2, 46
LDI r3, 65
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
