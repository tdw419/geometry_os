; DESCRIPTION: Renders a red disk with center (320, 113) and radius 35.
; PLAN: r0=320(x), r1=113(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 113
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
