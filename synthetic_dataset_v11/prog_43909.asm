; DESCRIPTION: Renders a cyan disk with center (123, 95) and radius 35.
; PLAN: r0=123(x), r1=95(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 95
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
