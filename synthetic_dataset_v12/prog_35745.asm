; DESCRIPTION: Draws a black line from (202, 30) to (376, 59).
; PLAN: r0=202(x1), r1=30(y1), r2=376(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 30
LDI r2, 376
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
