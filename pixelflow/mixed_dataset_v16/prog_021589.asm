; DESCRIPTION: Places a black line segment connecting (243, 38) to (130, 205).
; PLAN: r0=243(x1), r1=38(y1), r2=130(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 38
LDI r2, 130
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
