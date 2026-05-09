; DESCRIPTION: Draws a black line from (23, 58) to (99, 22).
; PLAN: r0=23(x1), r1=58(y1), r2=99(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 58
LDI r2, 99
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
