; DESCRIPTION: Places a white circle of radius 47 at center (443, 203).
; PLAN: r0=443(x), r1=203(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 203
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
