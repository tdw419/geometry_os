; DESCRIPTION: Draws a yellow line from (60, 99) to (415, 90).
; PLAN: r0=60(x1), r1=99(y1), r2=415(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 99
LDI r2, 415
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
