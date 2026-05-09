; DESCRIPTION: Draws a black line from (224, 216) to (25, 25).
; PLAN: r0=224(x1), r1=216(y1), r2=25(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 216
LDI r2, 25
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
