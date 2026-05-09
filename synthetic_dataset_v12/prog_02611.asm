; DESCRIPTION: Draws a black line from (28, 150) to (97, 39).
; PLAN: r0=28(x1), r1=150(y1), r2=97(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 150
LDI r2, 97
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
