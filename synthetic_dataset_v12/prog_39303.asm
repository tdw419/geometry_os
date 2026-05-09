; DESCRIPTION: Renders a cyan disk with center (218, 155) and radius 28.
; PLAN: r0=218(x), r1=155(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 155
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
