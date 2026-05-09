; DESCRIPTION: Places a green line segment connecting (396, 253) to (279, 5).
; PLAN: r0=396(x1), r1=253(y1), r2=279(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 253
LDI r2, 279
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
