; DESCRIPTION: Renders a cyan circular shape at (267, 21) with radius 53.
; PLAN: r0=267(x), r1=21(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 21
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
