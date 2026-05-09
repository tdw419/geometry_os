; DESCRIPTION: Renders a cyan disk with center (400, 140) and radius 77.
; PLAN: r0=400(x), r1=140(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 140
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
