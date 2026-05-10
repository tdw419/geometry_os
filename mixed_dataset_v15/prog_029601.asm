; DESCRIPTION: Places a orange circle of radius 30 at center (150, 198).
; PLAN: r0=150(x), r1=198(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 198
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
