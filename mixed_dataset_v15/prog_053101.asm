; DESCRIPTION: Places a cyan disk with center (246, 86) and radius 17.
; PLAN: r0=246(x), r1=86(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 86
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
