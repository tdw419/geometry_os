; DESCRIPTION: Places a cyan circle of radius 30 at center (247, 144).
; PLAN: r0=247(x), r1=144(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 144
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
