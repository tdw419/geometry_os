; DESCRIPTION: Draws a black line from (326, 29) to (175, 135).
; PLAN: r0=326(x1), r1=29(y1), r2=175(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 29
LDI r2, 175
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
