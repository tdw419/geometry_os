; DESCRIPTION: Places a orange circle of radius 14 at center (215, 153).
; PLAN: r0=215(x), r1=153(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 153
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
