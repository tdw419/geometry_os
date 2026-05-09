; DESCRIPTION: Renders a cyan disk with center (174, 135) and radius 11.
; PLAN: r0=174(x), r1=135(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 135
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
