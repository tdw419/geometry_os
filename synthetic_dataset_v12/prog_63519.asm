; DESCRIPTION: Draws a blue line from (153, 123) to (498, 42).
; PLAN: r0=153(x1), r1=123(y1), r2=498(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 123
LDI r2, 498
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
