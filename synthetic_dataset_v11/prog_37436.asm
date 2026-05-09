; DESCRIPTION: Renders a green disk with center (168, 48) and radius 42.
; PLAN: r0=168(x), r1=48(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 48
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
