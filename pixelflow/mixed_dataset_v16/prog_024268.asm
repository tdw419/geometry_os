; DESCRIPTION: Draws a green line from (337, 188) to (373, 28).
; PLAN: r0=337(x1), r1=188(y1), r2=373(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 188
LDI r2, 373
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
