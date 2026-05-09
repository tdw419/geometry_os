; DESCRIPTION: Renders a cyan disk with center (246, 152) and radius 18.
; PLAN: r0=246(x), r1=152(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 152
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
