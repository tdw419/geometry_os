; DESCRIPTION: Places a orange circle of radius 28 at center (50, 168).
; PLAN: r0=50(x), r1=168(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 168
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
