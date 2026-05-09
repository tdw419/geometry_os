; DESCRIPTION: Creates a magenta circular shape at (197, 149) with radius 13.
; PLAN: r0=197(x), r1=149(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 149
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
