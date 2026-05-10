; DESCRIPTION: Composite: Sets a single magenta pixel at (68, 62) then Renders a green disk with center (60, 194) and radius 38.
; PLAN: r0=68(x), r1=62(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=60(x), r6=194(y), r7=38(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 68
LDI r1, 62
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 60
LDI r6, 194
LDI r7, 38
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
