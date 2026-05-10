; DESCRIPTION: Draws a white line from (10, 157) to (26, 224).
; PLAN: r0=10(x1), r1=157(y1), r2=26(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 157
LDI r2, 26
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
