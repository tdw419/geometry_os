; DESCRIPTION: Renders a orange circular shape at (168, 89) with radius 57.
; PLAN: r0=168(x), r1=89(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 89
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
