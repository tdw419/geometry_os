; DESCRIPTION: Draws a red line from (317, 169) to (257, 148).
; PLAN: r0=317(x1), r1=169(y1), r2=257(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 169
LDI r2, 257
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
