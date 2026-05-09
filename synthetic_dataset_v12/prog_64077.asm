; DESCRIPTION: Draws a black line from (62, 228) to (471, 131).
; PLAN: r0=62(x1), r1=228(y1), r2=471(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 228
LDI r2, 471
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
