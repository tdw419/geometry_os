; DESCRIPTION: Renders a cyan disk with center (407, 73) and radius 50.
; PLAN: r0=407(x), r1=73(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 73
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
