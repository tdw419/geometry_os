; DESCRIPTION: Draws a purple line from (139, 28) to (27, 76).
; PLAN: r0=139(x1), r1=28(y1), r2=27(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 28
LDI r2, 27
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
