; DESCRIPTION: Renders a cyan disk with center (108, 154) and radius 15.
; PLAN: r0=108(x), r1=154(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 154
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
