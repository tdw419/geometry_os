; DESCRIPTION: Renders a cyan disk with center (141, 135) and radius 57.
; PLAN: r0=141(x), r1=135(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 135
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
