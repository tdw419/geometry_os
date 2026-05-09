; DESCRIPTION: Renders a cyan disk with center (270, 149) and radius 44.
; PLAN: r0=270(x), r1=149(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 149
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
