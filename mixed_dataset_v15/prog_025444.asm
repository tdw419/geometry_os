; DESCRIPTION: Draws a black line from (504, 140) to (324, 5).
; PLAN: r0=504(x1), r1=140(y1), r2=324(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 140
LDI r2, 324
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
