; DESCRIPTION: Draws a black line from (90, 20) to (315, 36).
; PLAN: r0=90(x1), r1=20(y1), r2=315(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 20
LDI r2, 315
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
