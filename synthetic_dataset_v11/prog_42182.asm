; DESCRIPTION: Draws a orange line from (207, 246) to (214, 164).
; PLAN: r0=207(x1), r1=246(y1), r2=214(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 246
LDI r2, 214
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
