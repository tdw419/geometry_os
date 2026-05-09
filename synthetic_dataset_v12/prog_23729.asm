; DESCRIPTION: Renders a cyan disk with center (72, 112) and radius 39.
; PLAN: r0=72(x), r1=112(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 112
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
