; DESCRIPTION: Places a green line segment connecting (184, 213) to (101, 94).
; PLAN: r0=184(x1), r1=213(y1), r2=101(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 213
LDI r2, 101
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
