; DESCRIPTION: Renders a green circular shape at (198, 132) with radius 70.
; PLAN: r0=198(x), r1=132(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 132
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
