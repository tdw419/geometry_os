; DESCRIPTION: Draws a magenta line from (308, 41) to (197, 231).
; PLAN: r0=308(x1), r1=41(y1), r2=197(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 41
LDI r2, 197
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
