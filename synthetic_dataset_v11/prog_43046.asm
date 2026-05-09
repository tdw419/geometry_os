; DESCRIPTION: Draws a black line from (168, 247) to (89, 94).
; PLAN: r0=168(x1), r1=247(y1), r2=89(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 247
LDI r2, 89
LDI r3, 94
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
