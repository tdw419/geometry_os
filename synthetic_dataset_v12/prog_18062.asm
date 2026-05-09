; DESCRIPTION: Draws a black line from (81, 200) to (224, 69).
; PLAN: r0=81(x1), r1=200(y1), r2=224(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 200
LDI r2, 224
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
