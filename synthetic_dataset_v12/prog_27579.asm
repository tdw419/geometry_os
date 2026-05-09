; DESCRIPTION: Draws a white line from (153, 163) to (376, 247).
; PLAN: r0=153(x1), r1=163(y1), r2=376(x2), r3=247(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 163
LDI r2, 376
LDI r3, 247
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
