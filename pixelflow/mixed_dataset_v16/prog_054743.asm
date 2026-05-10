; DESCRIPTION: Draws a white line from (24, 131) to (326, 78).
; PLAN: r0=24(x1), r1=131(y1), r2=326(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 131
LDI r2, 326
LDI r3, 78
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
