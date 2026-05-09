; DESCRIPTION: Draws a yellow line from (297, 135) to (255, 4).
; PLAN: r0=297(x1), r1=135(y1), r2=255(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 135
LDI r2, 255
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
