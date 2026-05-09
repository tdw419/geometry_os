; DESCRIPTION: Draws a black line from (291, 120) to (373, 238).
; PLAN: r0=291(x1), r1=120(y1), r2=373(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 120
LDI r2, 373
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
