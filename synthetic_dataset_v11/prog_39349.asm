; DESCRIPTION: Draws a orange line from (214, 215) to (74, 188).
; PLAN: r0=214(x1), r1=215(y1), r2=74(x2), r3=188(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 215
LDI r2, 74
LDI r3, 188
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
