; DESCRIPTION: Renders a orange disk with center (168, 64) and radius 63.
; PLAN: r0=168(x), r1=64(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 64
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
