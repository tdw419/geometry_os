; DESCRIPTION: Draws a blue line from (42, 252) to (140, 103).
; PLAN: r0=42(x1), r1=252(y1), r2=140(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 252
LDI r2, 140
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
