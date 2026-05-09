; DESCRIPTION: Draws a orange line from (197, 95) to (42, 53).
; PLAN: r0=197(x1), r1=95(y1), r2=42(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 95
LDI r2, 42
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
