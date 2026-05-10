; DESCRIPTION: Draws a green line from (373, 62) to (132, 12).
; PLAN: r0=373(x1), r1=62(y1), r2=132(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 62
LDI r2, 132
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
