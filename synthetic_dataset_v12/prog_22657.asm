; DESCRIPTION: Draws a green line from (337, 144) to (16, 17).
; PLAN: r0=337(x1), r1=144(y1), r2=16(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 144
LDI r2, 16
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
