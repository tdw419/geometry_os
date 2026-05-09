; DESCRIPTION: Draws a yellow line from (192, 77) to (442, 150).
; PLAN: r0=192(x1), r1=77(y1), r2=442(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 77
LDI r2, 442
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
