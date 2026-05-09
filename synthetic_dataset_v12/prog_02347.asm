; DESCRIPTION: Renders a cyan disk with center (330, 64) and radius 58.
; PLAN: r0=330(x), r1=64(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 64
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
