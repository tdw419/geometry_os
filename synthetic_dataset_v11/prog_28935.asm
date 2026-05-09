; DESCRIPTION: Draws a black line from (151, 83) to (14, 162).
; PLAN: r0=151(x1), r1=83(y1), r2=14(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 83
LDI r2, 14
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
