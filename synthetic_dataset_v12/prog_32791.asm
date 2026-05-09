; DESCRIPTION: Places a white line segment connecting (396, 32) to (405, 196).
; PLAN: r0=396(x1), r1=32(y1), r2=405(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 32
LDI r2, 405
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
