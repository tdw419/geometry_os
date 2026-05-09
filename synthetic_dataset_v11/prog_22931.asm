; DESCRIPTION: Renders a cyan disk with center (138, 214) and radius 14.
; PLAN: r0=138(x), r1=214(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 214
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
