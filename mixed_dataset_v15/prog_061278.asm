; DESCRIPTION: Draws a magenta line from (308, 41) to (209, 34).
; PLAN: r0=308(x1), r1=41(y1), r2=209(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 41
LDI r2, 209
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
