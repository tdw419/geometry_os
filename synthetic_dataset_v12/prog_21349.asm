; DESCRIPTION: Draws a purple line from (446, 71) to (442, 44).
; PLAN: r0=446(x1), r1=71(y1), r2=442(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 71
LDI r2, 442
LDI r3, 44
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
