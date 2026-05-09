; DESCRIPTION: Draws a white line from (70, 94) to (374, 17).
; PLAN: r0=70(x1), r1=94(y1), r2=374(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 94
LDI r2, 374
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
