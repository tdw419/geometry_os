; DESCRIPTION: Draws a black line from (67, 3) to (119, 117).
; PLAN: r0=67(x1), r1=3(y1), r2=119(x2), r3=117(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 3
LDI r2, 119
LDI r3, 117
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
