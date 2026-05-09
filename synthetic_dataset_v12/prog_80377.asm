; DESCRIPTION: Draws a orange line from (327, 204) to (179, 153).
; PLAN: r0=327(x1), r1=204(y1), r2=179(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 204
LDI r2, 179
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
