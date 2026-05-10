; DESCRIPTION: Draws a orange line from (146, 215) to (476, 101).
; PLAN: r0=146(x1), r1=215(y1), r2=476(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 215
LDI r2, 476
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
