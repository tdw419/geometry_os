; DESCRIPTION: Renders a magenta circular shape at (231, 175) with radius 10.
; PLAN: r0=231(x), r1=175(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 175
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
