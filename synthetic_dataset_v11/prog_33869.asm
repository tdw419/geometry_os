; DESCRIPTION: Draws a black line from (117, 78) to (16, 229).
; PLAN: r0=117(x1), r1=78(y1), r2=16(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 78
LDI r2, 16
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
