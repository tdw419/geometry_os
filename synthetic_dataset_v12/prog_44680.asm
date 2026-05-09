; DESCRIPTION: Places a orange circle of radius 69 at center (384, 178).
; PLAN: r0=384(x), r1=178(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 178
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
