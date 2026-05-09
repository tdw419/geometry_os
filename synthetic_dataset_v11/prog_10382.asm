; DESCRIPTION: Draws a white line from (55, 10) to (160, 224).
; PLAN: r0=55(x1), r1=10(y1), r2=160(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 10
LDI r2, 160
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
