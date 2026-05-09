; DESCRIPTION: Renders a cyan disk with center (135, 113) and radius 71.
; PLAN: r0=135(x), r1=113(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 113
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
