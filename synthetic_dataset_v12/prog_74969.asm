; DESCRIPTION: Draws a black line from (67, 83) to (286, 188).
; PLAN: r0=67(x1), r1=83(y1), r2=286(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 83
LDI r2, 286
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
