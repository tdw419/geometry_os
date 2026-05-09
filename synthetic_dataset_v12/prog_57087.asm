; DESCRIPTION: Draws a orange line from (509, 183) to (327, 6).
; PLAN: r0=509(x1), r1=183(y1), r2=327(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 183
LDI r2, 327
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
