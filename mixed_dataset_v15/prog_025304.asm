; DESCRIPTION: Renders a cyan disk with center (241, 174) and radius 56.
; PLAN: r0=241(x), r1=174(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 174
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
