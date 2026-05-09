; DESCRIPTION: Draws a black line from (271, 122) to (435, 98).
; PLAN: r0=271(x1), r1=122(y1), r2=435(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 122
LDI r2, 435
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
