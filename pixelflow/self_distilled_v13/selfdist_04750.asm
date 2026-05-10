; DESCRIPTION: Renders a white circular shape at (196, 149) with radius 16.
; PLAN: r0=196(x), r1=149(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 149
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
