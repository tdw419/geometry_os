; DESCRIPTION: Draws a black line from (462, 103) to (376, 168).
; PLAN: r0=462(x1), r1=103(y1), r2=376(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 103
LDI r2, 376
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
