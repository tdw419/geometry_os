; DESCRIPTION: Places a white line segment connecting (396, 63) to (468, 197).
; PLAN: r0=396(x1), r1=63(y1), r2=468(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 63
LDI r2, 468
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
