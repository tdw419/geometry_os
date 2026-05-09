; DESCRIPTION: Places a cyan circle of radius 48 at center (455, 204).
; PLAN: r0=455(x), r1=204(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 204
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
