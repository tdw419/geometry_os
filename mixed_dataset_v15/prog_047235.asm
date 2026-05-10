; DESCRIPTION: Renders a blue disk with center (439, 59) and radius 42.
; PLAN: r0=439(x), r1=59(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 59
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
