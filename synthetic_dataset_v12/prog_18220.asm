; DESCRIPTION: Draws a black line from (332, 67) to (24, 65).
; PLAN: r0=332(x1), r1=67(y1), r2=24(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 67
LDI r2, 24
LDI r3, 65
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
