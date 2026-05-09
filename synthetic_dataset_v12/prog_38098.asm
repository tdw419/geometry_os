; DESCRIPTION: Draws a yellow line from (255, 94) to (306, 235).
; PLAN: r0=255(x1), r1=94(y1), r2=306(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 94
LDI r2, 306
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
