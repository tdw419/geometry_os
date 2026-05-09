; DESCRIPTION: Draws a orange line from (16, 60) to (197, 158).
; PLAN: r0=16(x1), r1=60(y1), r2=197(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 60
LDI r2, 197
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
