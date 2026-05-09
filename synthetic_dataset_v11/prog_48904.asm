; DESCRIPTION: Draws a black line from (224, 2) to (44, 6).
; PLAN: r0=224(x1), r1=2(y1), r2=44(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 2
LDI r2, 44
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
