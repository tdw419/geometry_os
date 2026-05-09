; DESCRIPTION: Places a orange circle of radius 70 at center (147, 74).
; PLAN: r0=147(x), r1=74(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 74
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
