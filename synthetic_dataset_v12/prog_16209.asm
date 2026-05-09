; DESCRIPTION: Draws a white line from (63, 99) to (353, 10).
; PLAN: r0=63(x1), r1=99(y1), r2=353(x2), r3=10(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 99
LDI r2, 353
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
