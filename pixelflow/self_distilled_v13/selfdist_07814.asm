; DESCRIPTION: Draws a orange line from (36, 45) to (126, 187).
; PLAN: r0=36(x1), r1=45(y1), r2=126(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 45
LDI r2, 126
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
