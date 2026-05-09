; DESCRIPTION: Draws a black line from (399, 129) to (248, 161).
; PLAN: r0=399(x1), r1=129(y1), r2=248(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 129
LDI r2, 248
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
