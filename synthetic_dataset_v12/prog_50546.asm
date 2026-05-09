; DESCRIPTION: Renders a cyan disk with center (65, 25) and radius 21.
; PLAN: r0=65(x), r1=25(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 25
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
