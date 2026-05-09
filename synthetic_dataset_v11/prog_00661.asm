; DESCRIPTION: Places a orange circle of radius 29 at center (213, 153).
; PLAN: r0=213(x), r1=153(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 153
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
