; DESCRIPTION: Draws a green line from (93, 150) to (308, 253).
; PLAN: r0=93(x1), r1=150(y1), r2=308(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 150
LDI r2, 308
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
