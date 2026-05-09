; DESCRIPTION: Renders a red disk with center (86, 37) and radius 16.
; PLAN: r0=86(x), r1=37(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 37
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
