; DESCRIPTION: Places a orange circle of radius 60 at center (443, 70).
; PLAN: r0=443(x), r1=70(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 70
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
