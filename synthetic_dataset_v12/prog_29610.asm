; DESCRIPTION: Draws a white line from (411, 224) to (293, 224).
; PLAN: r0=411(x1), r1=224(y1), r2=293(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 224
LDI r2, 293
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
