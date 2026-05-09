; DESCRIPTION: Draws a green line from (269, 97) to (328, 135).
; PLAN: r0=269(x1), r1=97(y1), r2=328(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 97
LDI r2, 328
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
