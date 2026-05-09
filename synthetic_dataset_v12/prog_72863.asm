; DESCRIPTION: Renders a cyan disk with center (123, 112) and radius 65.
; PLAN: r0=123(x), r1=112(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 112
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
