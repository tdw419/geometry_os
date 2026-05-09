; DESCRIPTION: Draws a white line from (192, 25) to (86, 2).
; PLAN: r0=192(x1), r1=25(y1), r2=86(x2), r3=2(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 25
LDI r2, 86
LDI r3, 2
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
