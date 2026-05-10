; DESCRIPTION: Places a white line segment connecting (354, 179) to (481, 229).
; PLAN: r0=354(x1), r1=179(y1), r2=481(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 179
LDI r2, 481
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
