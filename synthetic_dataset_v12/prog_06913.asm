; DESCRIPTION: Creates a orange circular shape at (443, 194) with radius 29.
; PLAN: r0=443(x), r1=194(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 194
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
