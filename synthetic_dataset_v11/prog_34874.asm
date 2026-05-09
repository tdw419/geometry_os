; DESCRIPTION: Renders a cyan disk with center (138, 68) and radius 26.
; PLAN: r0=138(x), r1=68(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 68
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
