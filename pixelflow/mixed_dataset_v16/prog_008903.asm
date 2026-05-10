; DESCRIPTION: Draws a black line from (265, 129) to (10, 252).
; PLAN: r0=265(x1), r1=129(y1), r2=10(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 129
LDI r2, 10
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
