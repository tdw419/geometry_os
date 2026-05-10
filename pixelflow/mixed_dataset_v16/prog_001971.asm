; DESCRIPTION: Renders a orange circular shape at (58, 168) with radius 34.
; PLAN: r0=58(x), r1=168(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 168
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
