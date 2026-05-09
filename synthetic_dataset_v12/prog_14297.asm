; DESCRIPTION: Draws a yellow line from (62, 250) to (509, 250).
; PLAN: r0=62(x1), r1=250(y1), r2=509(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 250
LDI r2, 509
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
