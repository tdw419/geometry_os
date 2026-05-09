; DESCRIPTION: Renders a cyan disk with center (298, 141) and radius 71.
; PLAN: r0=298(x), r1=141(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 141
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
