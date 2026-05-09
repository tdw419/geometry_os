; DESCRIPTION: Renders a cyan disk with center (152, 151) and radius 78.
; PLAN: r0=152(x), r1=151(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 151
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
