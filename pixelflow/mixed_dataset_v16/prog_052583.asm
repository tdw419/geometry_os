; DESCRIPTION: Draws a black line from (375, 124) to (192, 20).
; PLAN: r0=375(x1), r1=124(y1), r2=192(x2), r3=20(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 124
LDI r2, 192
LDI r3, 20
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
