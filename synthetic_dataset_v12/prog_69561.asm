; DESCRIPTION: Places a green line segment connecting (247, 6) to (109, 230).
; PLAN: r0=247(x1), r1=6(y1), r2=109(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 6
LDI r2, 109
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
