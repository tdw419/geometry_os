; DESCRIPTION: Places a orange circle of radius 15 at center (443, 198).
; PLAN: r0=443(x), r1=198(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 198
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
