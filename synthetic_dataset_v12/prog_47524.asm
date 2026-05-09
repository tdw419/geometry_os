; DESCRIPTION: Draws a black line from (12, 93) to (244, 163).
; PLAN: r0=12(x1), r1=93(y1), r2=244(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 93
LDI r2, 244
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
