; DESCRIPTION: Draws a black line from (265, 148) to (396, 32).
; PLAN: r0=265(x1), r1=148(y1), r2=396(x2), r3=32(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 148
LDI r2, 396
LDI r3, 32
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
