; DESCRIPTION: Draws a black line from (216, 152) to (31, 224).
; PLAN: r0=216(x1), r1=152(y1), r2=31(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 152
LDI r2, 31
LDI r3, 224
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
