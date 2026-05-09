; DESCRIPTION: Renders a cyan disk with center (146, 76) and radius 69.
; PLAN: r0=146(x), r1=76(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 76
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
