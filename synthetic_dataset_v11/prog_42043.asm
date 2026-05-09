; DESCRIPTION: Renders a red disk with center (173, 63) and radius 42.
; PLAN: r0=173(x), r1=63(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 63
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
