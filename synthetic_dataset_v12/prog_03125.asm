; DESCRIPTION: Renders a cyan disk with center (292, 48) and radius 31.
; PLAN: r0=292(x), r1=48(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 48
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
