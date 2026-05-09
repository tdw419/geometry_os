; DESCRIPTION: Renders a purple line between points (268, 160) and (243, 46).
; PLAN: r0=268(x1), r1=160(y1), r2=243(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 160
LDI r2, 243
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
