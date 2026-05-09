; DESCRIPTION: Draws a black line from (132, 99) to (375, 208).
; PLAN: r0=132(x1), r1=99(y1), r2=375(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 99
LDI r2, 375
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
