; DESCRIPTION: Places a white line segment connecting (210, 160) to (376, 86).
; PLAN: r0=210(x1), r1=160(y1), r2=376(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 160
LDI r2, 376
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
