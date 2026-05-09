; DESCRIPTION: Renders a cyan disk with center (406, 134) and radius 50.
; PLAN: r0=406(x), r1=134(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 134
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
