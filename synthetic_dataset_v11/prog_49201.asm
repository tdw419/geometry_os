; DESCRIPTION: Renders a cyan disk with center (154, 214) and radius 11.
; PLAN: r0=154(x), r1=214(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 214
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
