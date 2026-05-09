; DESCRIPTION: Renders a cyan disk with center (68, 188) and radius 14.
; PLAN: r0=68(x), r1=188(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 188
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
