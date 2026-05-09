; DESCRIPTION: Draws a black line from (115, 12) to (280, 88).
; PLAN: r0=115(x1), r1=12(y1), r2=280(x2), r3=88(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 12
LDI r2, 280
LDI r3, 88
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
