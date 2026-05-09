; DESCRIPTION: Draws a black line from (34, 129) to (84, 249).
; PLAN: r0=34(x1), r1=129(y1), r2=84(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 129
LDI r2, 84
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
