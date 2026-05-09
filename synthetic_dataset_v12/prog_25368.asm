; DESCRIPTION: Places a cyan circle of radius 66 at center (279, 144).
; PLAN: r0=279(x), r1=144(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 144
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
