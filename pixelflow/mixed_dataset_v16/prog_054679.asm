; DESCRIPTION: Draws a green line from (184, 251) to (28, 94).
; PLAN: r0=184(x1), r1=251(y1), r2=28(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 251
LDI r2, 28
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
