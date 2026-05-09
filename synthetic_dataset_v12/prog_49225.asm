; DESCRIPTION: Draws a purple line from (76, 194) to (508, 29).
; PLAN: r0=76(x1), r1=194(y1), r2=508(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 194
LDI r2, 508
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
