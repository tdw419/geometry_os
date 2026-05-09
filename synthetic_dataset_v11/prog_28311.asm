; DESCRIPTION: Draws a white line from (151, 41) to (115, 224).
; PLAN: r0=151(x1), r1=41(y1), r2=115(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 41
LDI r2, 115
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
