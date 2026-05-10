; DESCRIPTION: Draws a blue line from (376, 96) to (18, 247).
; PLAN: r0=376(x1), r1=96(y1), r2=18(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 96
LDI r2, 18
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
