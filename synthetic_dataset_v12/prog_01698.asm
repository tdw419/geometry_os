; DESCRIPTION: Draws a green line from (476, 158) to (150, 68).
; PLAN: r0=476(x1), r1=158(y1), r2=150(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 158
LDI r2, 150
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
