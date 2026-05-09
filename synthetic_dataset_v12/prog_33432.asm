; DESCRIPTION: Renders a cyan disk with center (396, 108) and radius 54.
; PLAN: r0=396(x), r1=108(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 108
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
