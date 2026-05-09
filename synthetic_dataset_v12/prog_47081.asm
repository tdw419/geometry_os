; DESCRIPTION: Draws a magenta line from (376, 253) to (317, 247).
; PLAN: r0=376(x1), r1=253(y1), r2=317(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 253
LDI r2, 317
LDI r3, 247
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
