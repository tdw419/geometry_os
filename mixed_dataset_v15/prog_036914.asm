; DESCRIPTION: Renders a green disk with center (380, 168) and radius 55.
; PLAN: r0=380(x), r1=168(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 168
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
