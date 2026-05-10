; DESCRIPTION: Renders a white circular shape at (350, 149) with radius 53.
; PLAN: r0=350(x), r1=149(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 149
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
