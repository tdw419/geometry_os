; DESCRIPTION: Draws a white line from (23, 131) to (73, 224).
; PLAN: r0=23(x1), r1=131(y1), r2=73(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 131
LDI r2, 73
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
