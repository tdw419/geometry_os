; DESCRIPTION: Renders a green disk with center (113, 79) and radius 55.
; PLAN: r0=113(x), r1=79(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 79
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
