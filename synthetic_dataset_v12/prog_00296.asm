; DESCRIPTION: Renders a cyan disk with center (391, 90) and radius 34.
; PLAN: r0=391(x), r1=90(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 90
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
