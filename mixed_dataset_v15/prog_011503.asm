; DESCRIPTION: Draws a magenta line from (164, 10) to (104, 41).
; PLAN: r0=164(x1), r1=10(y1), r2=104(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 10
LDI r2, 104
LDI r3, 41
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
