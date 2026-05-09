; DESCRIPTION: Draws a yellow line from (143, 25) to (16, 90).
; PLAN: r0=143(x1), r1=25(y1), r2=16(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 25
LDI r2, 16
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
