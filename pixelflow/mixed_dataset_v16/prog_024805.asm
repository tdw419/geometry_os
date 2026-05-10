; DESCRIPTION: Renders a cyan disk with center (103, 108) and radius 43.
; PLAN: r0=103(x), r1=108(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 108
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
