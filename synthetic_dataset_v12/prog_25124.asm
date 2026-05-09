; DESCRIPTION: Renders a cyan disk with center (238, 108) and radius 50.
; PLAN: r0=238(x), r1=108(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 108
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
