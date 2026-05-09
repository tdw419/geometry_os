; DESCRIPTION: Draws a purple line from (255, 94) to (86, 83).
; PLAN: r0=255(x1), r1=94(y1), r2=86(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 94
LDI r2, 86
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
