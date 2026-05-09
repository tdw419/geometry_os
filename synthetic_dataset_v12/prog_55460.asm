; DESCRIPTION: Renders a blue disk with center (352, 116) and radius 77.
; PLAN: r0=352(x), r1=116(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 116
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
